import Foundation

/*
 1. assert
 - 특정조건을 체크하고, 조건이 성립되지 않으면 -> 메세지를 출력하게 할 수 있는 함수
 - assert 함수는 디버깅 모드에서만 동작
 - 주로, 디버깅 중 조건의 검증을 위해 사용!
 
 
 2. guard 문
 - 함수 내에서 사용
 - 뭔가를 검사하여, 그 다음에 오는 코드를 실행할지 말지 결정하는 것
 - guard 문에 주어진 조건문이 거짓일때 구문이 실행됨
 */


// 1. assert

var value = 0

// assert(() -> Bool)
// false 시, 실행
assert(value == 0, "value is 0? >>> value is \(value)")

value = 2
// assert(value == 0, "value is 0? >>> value is \(value)") // runtime error



// 2. guard
/*
 guard 조건 else {
    // 조건이 false 이면 else 구문이 실행되고
    // return / throw / break 를 통해, 이 후 코드를 실행하지 않도록 한다.
 }
 */

func guardTest(value: Int) {
    guard value == 0 else {
        print("value is not 0, but \(value)")
        return
    }
    print("Value is \(value)")
}

guardTest(value: 2)
guardTest(value: 0)


// 2.1 guard 문으로, optional 포장지 벗기기
// (= optional binding)
// optional binding 값은, 조건문 밖에서도(guard) 사용 가능
func guardTest2(value: Int?) {
    guard let value = value else {
        print("guardTest2: value is \(value)")
        return
    }
    print("guardTest2: Value is \(value)") // guard 문을 통한 optional binding 값
}

guardTest2(value: 0)
guardTest2(value: nil)
guardTest2(value: 2)
