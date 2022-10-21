import Foundation
import Combine

/// CombineLatest, Merge (= Operator)
/// 2개의 Publisher 을 합쳐서, 데이터를 받을 수 있는 Operator
/// 2개의 publisher 가 모두 받아야지 subscriber 동작
///     (2개의 publisher를 모두 받고싶을때 사용)(
/// 최근에 받은 데이터를 보낸다

/// CombineLatest
/// ex)
/// "a",              "b",                   "c"
///   1,             2,          3
///    "a",1      "b",2     "b",3    "c",3



// Basic combineLatest
let strPublisher = PassthroughSubject<String, Never>()
let numPublisher = PassthroughSubject<Int, Never>()

// 방법1)
strPublisher.combineLatest(numPublisher)
    .sink { (str, int) in
        print("Received Value: \(str), \(int)")
    }

// 방법2)
//Publishers.CombineLatest(publisher1, publisher2)
//    .sink { (str, int) in
//        print("Received Value: \(str), \(int)")
//    }

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")

numPublisher.send(2)
numPublisher.send(3)





// Advanced combineLatest
// ex) login function
let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

// 방법1
let validatedCrendetailsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map{ (userid, password) -> Bool in
        return !userid.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink { value in
        print("Credential Valid? : \(value)")
    }

// 방법2
//let validatedCrendetailsSubscription = Publishers.CombineLatest(usernamePublisher, passwordPublisher)
//    .map{ (userid, password) -> Bool in
//        return !userid.isEmpty && !password.isEmpty && password.count > 12
//    }
//    .sink { value in
//        print("Credential Valid? : \(value)")
//    }

usernamePublisher.send("Hakyung")
passwordPublisher.send("weakpw") // false
passwordPublisher.send(" ") // false
passwordPublisher.send("longandsafepassword") // true




// Merge
// 두 publisher의 output type이 같아야한다.
// 한번에 쭉- 받는 방식 <-> combineLatest : 튜플로 받는다.
// 어떤 publisher에 다른 publisher 합치느냐 순서에 따라, 값 출력 다름!
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher

// 방법1
//let mergePublisherSubscription = publisher2.merge(with: publisher1)
//    .sink { value in
//        print("Merge: subscription reveiced value: \(value)")
//    }

// 방법2
let mergePublisherSubscription = Publishers.Merge(publisher1, publisher2)
    .sink { value in
        print("Merge: subscription reveiced value: \(value)")
    }
