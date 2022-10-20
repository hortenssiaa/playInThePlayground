import Foundation
import Combine


/*
 Subject (Publisher)
 : subscriber가 달라고 요청하면, 받은 데이터를 전달해줌
 */


// Subject == publisher
// >> output type, error type 설정해줘야함
// 1. PassthroughSubject
// : send를 통해서 데이터가 주어졌을때, 데이터를 바로 passing해서 보내고, subscriber(sink)는 바로 데이터를 실행 코드에 맞게 출력한다.
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in // relay라는 publisher에, sink(subscriber)를 붙임
    print("subscription1 received value: \(value)")
}
relay.send("Hello")
relay.send("World!")


// 2. CurrentValueSubject
// : 초기값을 넣어줘야한다.
// 초기값을 hold하고 있기 때문에, 초기값 -> send로 넣어준값 순서대로 찍힘
let variable = CurrentValueSubject<String, Never>("kkk")
variable.send("initial value")

let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}
variable.send("More")
variable.send("sending!")
variable.value // 최근에 보낸 데이터 갖고있는 CurrentValueSubject




let publisher = ["Here", "we", "go"].publisher

// relay가 subscribe한다.
// relay는 send로 계속 데이터를 주입하지 않아도, publisher가 배출하는 데이터가 계속 전달이 된다.
publisher.subscribe(relay)
//publisher.subscribe(variable)
// 원래 형태가 publisher.sink or assign(subscriber) 이고,
