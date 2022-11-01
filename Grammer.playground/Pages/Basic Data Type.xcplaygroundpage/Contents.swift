import Foundation

// Int : 64bit 정수형
var someInt: Int = -100
someInt = 100

// UInt (Unsigned Int) : 부호가 없는 64bit 정수형
var someUInt: UInt = 200
//someUInt = -20 (X)

// Float : 32bit 부동 소수점 (고정되어있지 않음)
var someFloat: Float = 1.1
someFloat = 1
print(someFloat)

// Double : 64bit 부동 소수점
var someDouble: Double = 1.1
someDouble = 1
print(someDouble)

// Boole : true / false
var someBool: Bool = true
someBool.toggle()

// Character : 문자
var someCharacter: Character = "가"
someCharacter = "A"
someCharacter = "😁"
//someCharacter = "안녕" (X)

// String : 문자열
var someString: String = "드디어 봤다!👏🏼"

// Any : 모든 타입을 지칭하는 키워드
// 타입추론 : compile시, 값에 따라 해당 변수의 데이터 타입을 결정
var number = 10
type(of: number)
