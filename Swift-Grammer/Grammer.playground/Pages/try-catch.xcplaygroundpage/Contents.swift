import Foundation

/*
 try-catch == 에러처리
 - 프로그램 내에서 에러가 발생한 상황에 대해, 대응 & 복구하는 과정
 - swift에서는, run-time에서 에러 발생시; 처리하기위한
    - 발생 (throwing)
    - 감지 (catching)
    - 전파 (propagating)
    - 조작 (manipulating)
 */

/*
 ** Swift에서의 에러처리
 : swift에서 에러는, error protocol을 따르는 type의 값으로 표현된다.
 - error protocol은, 요구사항이 없는 빈 프로토콜이지만, 오류를 표현하기 위해 채택해야함
 - enum(열거형)은, 오류의 원인을 나누고 - 해당 오류의 특성에 대한 추가 정보를 제공하는 모델을 만드는데 적합하다
    >> swift에서는, enum을 통해 error의 종류를 표현하는게 가장 일반적!
 
 1. 함수에서 발생한 오류를, 해당함수를 호출한 코드에 전파 (throw)
 2. do-catch 문으로, 오류 처리하기 (do(try)-catch)
 3. optional값으로 오류 처리하기 (try?)
 4. 오류가 발생하지 않을것이라고 확신하기 (try!)
 */


// error protocol 채택한 열거형
enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
}

// 0. 오류 던지기 (throw)
throw PhoneError.batteryLow(batteryLevel: 20)
//Playground execution terminated: An error was thrown and was not caught:
//▿ PhoneError
//  ▿ batteryLow : 1 element
//    - batteryLevel : 20


//  1. 함수에서 발생한 오류를, 해당함수를 호출한 코드에 전파 (throw)
func checkPhoneBatteryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw
        PhoneError.batteryLow(batteryLevel: 20) }
    return "배터리가 상태가 정상입니다."
}

// throw method 사용하기
// : throw method는 에러를 반환할 수 있으니
// >> do-catch / try? / try! 로 오류 처리하기

// 2. do-catch 문으로, 오류 처리하기 (do(try)-catch)
do {
    try checkPhoneBatteryStatus(batteryLevel: 20)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.batteryLow(let batLevel) { // 연관값을, 상수 batLevel로 전달받게 함
    print("배터리 전원 부족 남은 배터리 : \(batLevel)")
} catch { // 그 외의 모든 오류
    print("그 외의 오류: \(error)")
    // error : catch 블록에는, 오류의 종류 명시하지 않아도, 암시적으로 error라는 이름의 지역상수에 오류 내용이 들어오게됨!
}



// 3. optional값으로 오류 처리하기 (try?)
/*
 - 오류를 optional 값으로 변환하여, 처리하기
 - 오류일시; 값은 nil 반환
*/
var status = try? checkPhoneBatteryStatus(batteryLevel: -1) // nil
status = try? checkPhoneBatteryStatus(batteryLevel: 30) // Optional("배터리가 상태가 정상입니다.")
print(status)


// 4. 오류가 발생하지 않을것이라고 확신하기 (try!)
// >> 오류가 절대로 일어나지 않을것이라고 확신할때! 사용
// >> 안그러면, run-time error! 프로그램 강제 종료됨
var status2 = try! checkPhoneBatteryStatus(batteryLevel: 30) // 배터리가 상태가 정상입니다.
print(status2)
