import Foundation
import Combine

/// Combine - Operator
/// find more : (about operator combine) https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine
/// (about append combine) https://developer.apple.com/documentation/combine/publisher/append(_:)-5yh02



var subscription = Set<AnyCancellable>() // subscription여러개 담을 수 있는 통


// 1. removeDuplicates
/*
 같은 데이터가 publisher에 들어올때, 중복 삭제후 보낸다.
 */
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
    print("\(value)")
    }.store(in: &subscription)
// .store(in: &subscription) : 해당 subscription이 var subscription = Set<AnyCancellable>() 통으로 들어간다.





// 2. compactMap
/*
 map등을 통해 transform한 내용중, nil인 값 제거후 보냄
 > optional하지 않은 값으로
 
 >> Float() 으로 casting할때, string의 알파벳은 안되니 -> nil
 */
let strings = ["a", "1.24", "3", "def", "46", "0.23"].publisher
strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscription)






// 3. ignoreOutput
/*
 publisher - subscriber 구독관계는 형성되었지만,
 이미 publisher로 값을 받았고, 새로들어오는 이벤트 데이터에 대해, 더이상 신경쓰고싶지 않을때 사용
 >> 값 output안시킴
 */
let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) }).store(in: &subscription)





// 4. prefix
/*
 여러개 data들어올때, 정한 n개 외에는 output 시키지 않음!
 */
let tens = (1...10).publisher

tens
    .prefix(4)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscription)
