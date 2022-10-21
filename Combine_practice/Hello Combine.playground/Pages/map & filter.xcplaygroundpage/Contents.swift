import Foundation
import Combine

/// Operator
/// Publisher에게 받은 값을 가공하여 Subscriber에게 넘겨주는 중간역할자


// Transform - Map
// : 넘겨받은 데이터를 -> 특정 형태로 가공시켜 넘겨주는 것
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("Transformed Vaule: \(value)")
    }
numPublisher.send(10)
numPublisher.send(11)
numPublisher.send(12)
subscription1.cancel()

/*
 1. map : map 이라는 Operator (가공하는 공간)
 2. $0 : Publisher가 send를 통해 넘겨받은 값
 */



// Filter
// 넘겨받은 데이터중, 일부 조건을 만족하는 것만 넘기는
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
    .filter{$0.contains("a")}
    .sink { value in
        print("Filtered Value: \(value)")
    }
stringPublisher.send("Hakyung")
stringPublisher.send("Jason")
stringPublisher.send("bcd")
stringPublisher.send("Jenny")
stringPublisher.send("Relain")
subscription2.cancel()

/*
 1. filter : $0에서, a를 포함한 것만 넘겨라!
 2. $0 : 넘어온(받은) String (PassthroughSubject<String, Never>() 의 String)
 */
