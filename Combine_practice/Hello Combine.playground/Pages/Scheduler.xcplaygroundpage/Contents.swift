import Foundation
import Combine

/// ** Scheduler
/// Publisher & Subscriber 사이에서 Closure가  어떻게 실행될지 정해준다.
/// 메소드
/// 1) subscribe(on :)
/// 2) receive(on :)
/// >> Scheduler은, 작업간 효율적으로 resources를 활용할 수 있게 switching 시켜준다.
/// >> 비동기 작업중 중요한것; thread를 잘 고려하면서, data받아서 UI update하는 것 (thread safe하게)

let arrPublisher = [1, 2, 4].publisher

// custome Queue
let queue = DispatchQueue(label: "customQ")

let subscription = arrPublisher
    .subscribe(on: queue)
    // map은 Operator 이다.
    // 실제로, heavy한 작업을 operator에서 하면, main스레드 X -> custom스레드에서 돌아가게 하고싶은 것
    .map { value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    // Operator를 마친 값을 Subscriber가 (sink)
    .sink { value in
        print("Receive Value: \(value), thread: \(Thread.current)")
}
