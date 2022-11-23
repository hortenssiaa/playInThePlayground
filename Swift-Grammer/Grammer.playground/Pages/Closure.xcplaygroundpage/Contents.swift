import Foundation

/*
 Closure
 - 참조 type
 - 코드에서 전달 및 사용할 수 있는 독립기능의 블록
 - 일급 객체 역할
    ** 일급 객체란?
    1. 변수/상수 등으로 저장하거나 전달 가능
    2. 전달인자로 보낼 수 있고
    3. 함수의 반한값이 될수도 있다 (return 클로저)
 - 보통 Closure 라고 하면?
    >> Unnamed Closure (익명함수) 지칭
    >> 다만, Named closure도 존재한다는 것
 - 표현식 : 클로저 head, 클로저 body 로 이뤄져있음
    { (매개변수) -> 리턴타입 in
        실행구문
    }
 */

// closure은, 보통 익명함수를 지칭
// 1. 변수/상수에 저장/전달 가능
let hello = { () -> () in // 파라매터, 리턴값 모두 존재X 경우
    print("hello")
}

hello() // 함수 호출과 동일 (= 클로저(함수)가 대입돼있으니깐)


// 1-1. 파라미터, 리턴타입 있는 클로저 선언
let hello2 = { (name: String) -> String in
    return "Hello, \(name)!"
}
// ** 주의사항!
/*
 ** name 파라미터 인식 주의!
 함수처럼, 파라미터의 name이 단독으로 쓰였으니, 전달인자 lable이자 파라미터 name이라고 생각할 수 있겠으나!
 -> 클로저에서는, 전달인자 lable사용 X
 -> 따라서, name은, 전달인자 lable이 X, 파라미터 O
 -> 그래서, 클로저 호출시 일반함수 호출하는거처럼 하면 >> Error!
    >> ex) hello2(name: "Hakyung") (X: name은 전달인자 lable 가 아니기때문)
    >> ex) hello2("Hakyung") (O)
 */

//hello2(name: "Hakyung")
hello2("Hakyng")


// 2. 함수의 파라미터 타입으로 클로저 전달하기
// 2-1. 파라미터와 리턴타입이 없는 클로저
func dosomething(closure: () -> ()) {
    closure() // doSomething 함수 호출시, closure가 실행되게
}

// 함수 호출
dosomething(closure: { () -> () in
    print("Hello doSomething")
})


// 3. 함수의 반한값이 될수도 있다 (return 클로저)
// 3-1. 파라미터와 리턴타입이 없는 클로저를 (리턴타입으로) 반환하는 함수
func doSomething2() -> () -> () {
    return { () -> () in // 반환 타입이, 파라미터와 리턴타입이 없는 클로저이므로
        print("Hello doSomething4")
    }
}

// 함수 호출
doSomething2()()



// 4. 읽기 쉬운 클로저로 바꾸기 == 후행 클로저 기능
// 클로저가 길어지거나, 가독성 떨어질때
/*
 후행 클로저?
 - 맨 마지막 매개변수로 전달되는 클로저에만 해당!
 - 매개변수로 클로저 여러개 전달시; 맨 마지막 클로저만 후행 클로저 사용 가능
 */
dosomething() { // 파라미터&반환값 없는 클로저이므로 >>> () -> () in 모두 생략 가능
    print("dosomething 후행클로저 실행")
}

// + dosomething과 같이, 단 하나의 클로저만 매개변수 전달시, 소괄호도 생략 가능!
dosomething {
    print("dosomething 소괄호도 생략")
}



// ** 다중 후행 클로저 : 매개변수에 다중 클로저가 있는 경우
func doSomethingMultiClosure(success: () -> (), fail: () -> ()) {
    
}

doSomethingMultiClosure { // 첫번째 클로저: success 매개변수 레이블 생략!
    <#code#>
} fail: {
    <#code#>
}



// 클로저 표현 간소화하기!
// >> 문법 최적화하여, 간소화하기

// 간소화 X version
func doSomethingMakeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1,2,3)
    // 매개변수로 받은 closure을 실행하는데,
    // 이때, 매개변수로 1,2,3을 넘겨주고 있다
}

// doSomethingMakeItShort 클로저 호출 - 경량 문법
doSomethingMakeItShort(closure: { (a, b, c) in    // 1. 파라미터 데이터 타입 생략
    return a + b + c   // 2. Type 유추를 통해, return 타입 생략 가능
})

// doSomethingMakeItShort 클로저 호출 - 약식
// 파라미터, 리턴 형식 생략
doSomethingMakeItShort(closure: {
    return $0 + $1 + $2 // 매개변수 이름 생략 -> 매개변수를 약식 인수 이름으로 대체! >> 매개변수 & in 키워드 삭제 가능
})

// doSomethingMakeItShort 클로저 호출 - 약식 2
// return 생략
// >> 단, 단일 return문일때!
doSomethingMakeItShort(closure: {
    $0 + $1 + $2
})

// X
// 단일 return문 아님
doSomethingMakeItShort(closure: {
    print("test")
    $0 + $1 + $2
})


// doSomethingMakeItShort 클로저 호출 - 후행 클로저로 작성 가능
doSomethingMakeItShort() {
    $0 + $1 + $2
}


// doSomethingMakeItShort 클로저 호출 - 후행 클로저로 작성 가능
// 단 하나의 클로저!만 매개변수 전달시,
// >> 소괄호, return, 매개변수 이름 & 매개변수 타입, in 키워드 생략 가능!
doSomethingMakeItShort {
    $0 + $1 + $2
}



/*
 **** 클로저 간결화
 >> 가독성 높아짐!
 
 * Class instance로 클로저 할당시;
  - 클로저와, 인스턴스 사이에 강한 순환참조가 생겨,
  - 메모리 leak 발생 가능
 */
