import Foundation
import Combine
import UIKit

/*
 *** iOS에서 기본으로 제공해주는 Publisher
 - URLSession.dataTask
 - NotificationCenter,
 - Timer
 에 대해서는 publisher가 자동으로 생긴다~!
 */




// 1. URLSessionTask Publisher and JSON Decoding Operator
/*
 URLSessionTask
 : URLSession을 통해서 서버에서 데이터를 받음
 */

// (1) dataTaskPublisher: URLSession dataTesk를 publisher로 만들어줌
// (2) .map { (data: Data, response: URLResponse) :  server에서 데이터를 받으면, data, response를 받게 된다.

struct SomeDecodable: Decodable { }
URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
        return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())

    /*
     decode
     : urlsesson에서 data task publisher를 이용하여 publisher로 만들고,
     : 특정 url에 request를 보내고 나서,
     : 서버에서받은 데이터의 정보를 가지고, decoding을 한다.
     >> decoding : 서버에서받은 데이터(정보)를, 앱 내에서쓰는 객체형으로 바꿔주는 것. (JSON형태로)
     */




// 2. Notifications
/*
 NotificationCenter
 : 기존 >>데이터를 전송하는데, notification객체에 싩어서 noti를 보내는 형식
 1) noti를 계속 쏘는 것
 2) noti를 observing하고있는 것이, noti가 쏳여지면, 그 noti를 받아서 작업을 수행
 3) 그것을, combine의 publisher를 이용할 수 있다
 */

let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil) // publisher가 noti(= Notification.Name("MyNoti"))에 대해서, 계속 publishing을 하겠다.
let subscription1 = notiPublisher.sink { _ in
    print("Noti Received")
}

center.post(name: noti, object: nil)
subscription1.cancel()

 /*
  1) center.publisher(for: noti, object: nil)
  : notification center 을 publisher로 만들었다.
  : publisher가 noti (for: noti)에 대해서, data를 방출할거야! 라고 subscription을 만들었다.
  
  2) noti를 받으면 (publisher for: noti), print("Noti Received")가 프린트가 되게
  
  3) center.post(name: noti, object: nil)
  : 그래서 실제로 noti를 보내보았다. 실제로 print("Noti Received") 문 호출이 되는지
  */






// 3. KeyPath binding to NSObject instances
/*
 1. UILabel() < NSObject
 2. Just(28)
 .map {"Age is \($0)"}
 .assign(to: \.text, on: ageLable)
 : UILabel()안에, 기본 property로 text가 있다.
 3. assign(to: \.text) >> to: KeyPath
 
 **정리
 KeyPath binding to NSObject instances의 뜻은,
 NSObject에 UILabel가 포함되어있고, 이 안에는 text property가 속해있다.
 즉, assign의 to자리인 keypath에는 NSObject의 속성이 올 수 있다(=binding)는 말!
 */

let ageLable = UILabel()
print("text: \(ageLable.text)")

// Just : publisher
Just(28)
    .map {"Age is \($0)"}
    .assign(to: \.text, on: ageLable) // UILabel()안에, 기본 property로 text가 있다.
print("text: \(ageLable.text)")





// 4. Timer
// autoconect 를 이용하면 subscribe 되면 바로 시작함

let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common) // 1초마다, .main (메인) 스레드에서, 방법은 .common (보통) 방법으로 한다.
    .autoconnect() // 어떤 subscriber가 이 publisher (timerPublisher)를 구독했을때, 바로 동작하게끔 하는 메서드

let subscription2 = timerPublisher.sink { time in
    print("time: \(time)")
}

// 초반의 5초는 진행후, 종료한다.
DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    subscription2.cancel()
}

