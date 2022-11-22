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
