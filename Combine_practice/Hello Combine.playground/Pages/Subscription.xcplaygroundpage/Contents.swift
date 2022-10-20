import Foundation
import Combine

/// PATTERN
/// Subscriber is attached to Publisher
/// Publisehr SENDS a Subscription
/// Subscriber REQUESTS N values
/// Publisehr sends N values or less
/// Publisehr sends completion

// Subscription
/*
 Subscription
 1) subscriber와 publisher가 연결됨을 나타낸다
 2) 쉽게 생각하면, publisher가 발행한 "구독 티켓!"
 3) 이 구독 티켓만 있어도, 데이터 받을 수 있음
 4) 이 구독 티켓이 사라지면, 구독 관계도 사라짐
 
 Cancellable protocol 관계를 따르고 있음
 방법 예시)
 - publisher.send(completion: .finished)
 - subscription.cancel()
 */

let subject = PassthroughSubject<String, Never>() // publisher

// publisher와 subscriber가 attached됐으니깐 (subject.sink), publisher (subject)가 subscription을 send 해주는 것임!
// == 어! 너는 내 data를 받을 자격이 돼! 하고 티켓을 줌 (subscription)
let subscribtion = subject
    // The print() operator prints you all lifecycle events.
    .print("[Debug] ") // 처음 관계 형성부터 모두 볼 수 있음
    .sink { value in
    print("subscription receivec value: \(value)")
}

subject.send("Hello")
subject.send("Hello again!")
subject.send("Hello for the last time!")
//subject.send(completion: .finished) // publisher - subscriber 관계 끝
subscribtion.cancel() // publisher - subscriber 관계 끝
subject.send("Hello there ...?")

