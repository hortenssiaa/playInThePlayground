//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
/*
 Subscriber
 1) Publisher에게 데이터를 요청함
 2) Input, Failure type 정의
 3) Publisher 구독후, 갯수 정함
 4) pip line 취소 가능 (= 구독취소 가능)

 Built-in Subscriber
 1) assign
 : Publisher가 제공한 데이터를, 특정 객체의 키패스에 할당
 2) sink
 : Publisher가 제공한 데이터를 받는 closure 제공
 */

// 1. 'Just' publisher : built in publisher
// 1) Data 1개만 보내보기
// Data를 한번 전송하고 끝나는 Publisher
// just.sink >> just라는 publisher을 구독하겠다(sink == Subscriber)

let just = Just(1000)
let subscription1 = just.sink { value in
    print("Received Value: \(value)")
}

// 2) Data 여러개 보내보기
// array publisher을 만드면, array의 index 0부터~ 읽는다고 알면 됨
let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value)")
}


// Subscriber : assgin
/* arrayPublisher.assign(to: \.property , on: object)
 >> 데이터가 Array라서, 계속 방출이 되는데,
 >> 방출이 될때마다, 그것을 어느 객체의 (on),
 >> 그 객체의 어느 프로퍼티 (to) 에 setting 할 것인지
*/
class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set propery to \(property)")
        }
    }
}

let object = MyClass()
object.property = 4

let subscription3 = arrayPublisher.assign(to: \.property , on: object)
print("Final Value: \(object.property)")




//: [Next](@next)
