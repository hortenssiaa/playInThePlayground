import UIKit

/*
 Optional Binding
 : optional 포장지 벗겨 값 갖고오는
 
 1. 명시적 해제(binding)
 - 강제 해제
 - 비강제 해제(옵셔널 바인딩)
 
 2. 묵시적 해제(binding)
 - 컴파일러에 의한 자동 해제
 - 옵셔널의 묵시적 해제
 */

// 1. optional 강제해제
var number: Int? = 3

print(number) // Optional(3)
print(number!) // **** 옵셔널 강제해제; 아주 위험!
// 예) nil을 강제해제시; error -> program forced termination




// 2-1. optional 비 강제해제 (if-else) - 안전
/*
 - result : optional을 추출해서 할당받을 변수(상수)
 - if-else 문이아닌, optional 값을 추출하는 구문으로 사용
 - if-else문으로의 추출시; 변수/상수를 if문 내에서만 사용 가능
 */
if let resut = number { // optional 추출 성공
    print(resut) // optional 추출걊
} else { // fail
    print("optional binding fails")
}


// 2-2. optional 비 강제해제 (guard) - 안전
/*
 - guard문으로 추출시; guard다음 함수 전체에서 사용 가능!
 - 예) print(result)
 */
func test() {
    let number: Int? = 5
    guard let resut = number else { return }
    print(resut)
}
test()




// 3. 묵시적 해제 - 자동해제 by compiler
/*
  optional값을 비교연산자(==, >, <, etc)로 비교시(딱 그때만);
  >> 컴파일러가 자동으로 옵셔널값 해제시킴
 */
let value: Int? = 6

if value == 6 { // 비교시! 딱 이때만
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}



// 4. 묵시적 해제 - 옵셔널 but 값 사용시에는 자동으로 해제

let string = "12"
var stringToInt: Int! = Int(string) // string이 문자일경우; nil 반환
print(stringToInt + 1)
