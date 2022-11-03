import UIKit

/*
 함수 : 함수는 작업의 가장 작은 단위이자 코드의 집합
 */


// 1. 매개변수 기본값 세팅
func greeting(friend: String, me: String = "hakyung") {
    print("Hello, \(friend)! I'm \(me)")
}

greeting(friend: "Albert")
greeting(friend: "Ken", me: "your friend hakyung.")


// 2. 전달인자 label로, 함수 매개변수 전달하기 (feat. from, to)
// >> 사용자입장; 매개변수의 역할 명확하게 표현 가능, 코드 가독성 높아짐
/*
 func 함수이름(전달인자레이블 매개변수이름: 매개변수타입, 전달인자레이블 매개변수이름: 매개변수타입...) -> 반환타입 {
    return 반환값
 }
 */
func sendMessage(from myName: String, to name: String) -> String {
    return "Hello \(name)! I'M \(myName)."
}
sendMessage(from: "hortenssiaa", to: "Ken")


// 3. 전달인자 label 사용하고싶지 않다면, -> wild card _ 사용
func sendMessage(_ name: String) -> String {
    return "Hello \(name)"
}
sendMessage("손하경")


// 4. 가변매개변수 : 몇개의 매개변수가 들어올지 모를때.
// 0개이상의 매개변수 가능 ... 으로 표현
// 가변매개변수 값은, [ ] 배열로써 사용 가능!!!!
func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends)! I'm \(me)."
}
sendMessage(me: "Hakyung", friends: "Ken", "Anne", "Taffy")


/*
 Swift는 함수형 프로그래밍 패러다임을 포함한, 다중 패러다임을 포함한 언어
 - 함수는, 1급 객체
 - 함수를 변수, 상수 등에 할당 가능
 - 함수를 매개변수를 통해 전달 가능
 */
