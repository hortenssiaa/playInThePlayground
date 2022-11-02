import UIKit

/*
 * Enum (열거형)
 : 서로 관계있는 것들을 -> 모아서 -> 표현한 것
 - 특정 타입을 표시할때 좋음
 - String으로 적어도 되지만, 에러를 방지하기 위해 미리 만들어줌
    예) today = "mom" -> 시간이 지난후 오타 발견때까지 알기 어려움
 - 하나의 새로운 타입@ 으로 사용 가능
 */

// 예1 ) 요일을 enum으로 만들기
enum WeekDay {
    case mon
    case tue
    case wed
    case thu
    case fri
}

let today: WeekDay = .mon // WeekDay.mon 이라는 뜻


// 예2 ) 미디어타입을 enum으로
enum MediaType {
    case audio
    case video
}

let mediaType: MediaType = .audio // MediaType.audio






/* 예3 )
 Enum + associated value (연관값)
 - associated value를 갖고있는 형태로 표현도 가능!
 */

enum MediaType2 {
    case audio(String)
    case video(String)
}

// audio, video라는 큰 틀은 있고,
// 이 안에도 많은 확장자가 있으니, 받을때 같이 받으면 좋은 예씨
var mp3: MediaType2 = .audio("mp3")
var h264: MediaType2 = .video("h264")

print("\(mp3), \(h264)")



// 예 4) ****************************
enum PhoneError {
    case unknown
    case batteryLow(String)
}

let error: PhoneError = .batteryLow("배터리가 곧 방전됩니다.")

/* 연관값 추측 : if / switch문 활용 */
switch error {
case .batteryLow(let message): // 연관값을 넘겨받도록 상수 message선언
    print(message)
    
case .unknown:
    print("알 수 없는 에러입니다.")
}




// 예 5) 나침판 ****************************
// - 하나의 새로운 타입으로 사용 가능
// - 열거형의 각 항목(case)는, 자체로도 한 값이지만, 항목이 원시값(초기값?)을 특정타입으로 갖게 할 수 도있다.
    // 예) CompassPoint: Stiring, case north = "북"
enum CompassPoint: String { // : String 은? 특정항목 (case)이 원시값을 갖도록 하는 선언
//    case north, south, east, west
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
}

var direction = CompassPoint.east // east
direction = .north // north
// compiler가 이미 direction은 CompassPath Type이라는 것을 추론하기 때문에!

/* 원시값을 사용하고 싶다면? : rawValue */
print(direction.rawValue)

switch direction {
case .north:
    print(direction.rawValue)
    
case .south:
    print(direction.rawValue)

case .east:
    print(direction.rawValue)

case .west:
    print(direction.rawValue)
}


/* 원시값으로, 열거형 항목값으로 반환도 가능 */
let direction2 = CompassPoint(rawValue: "남")
