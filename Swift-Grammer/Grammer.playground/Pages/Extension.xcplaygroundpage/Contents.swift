import Foundation

/*
 Extension
 : 기존의 class, structure, enum, protocol 에 + 새로운 기능 추가!
 
 ** 추가가능한 기능
 - 연산 타입 property (예) 짝수/홀수 계산 property) / 연산 instance property
 - 타입 method / instance method
 - initialize
 - subscript
 - 중첩 타입
 - 특정 protocol을 준수할 수 있도록 기능 추가 가능!
 
 ** Extension으로, 새로운 기능을 추가 가능하지만,
 - 기존에 존재하는 기능을 override 할 수 없음
 */

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

let number = 3
number.isOdd // true
number.isEven // false


extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

let string = "100"
let string2 = "13a"

string.convertToInt() // 100
string2.convertToInt() // nil
