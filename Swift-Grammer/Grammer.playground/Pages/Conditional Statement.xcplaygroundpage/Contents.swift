import UIKit

// 1. if
let age = 20

if age < 19 {
    print("미성년자입니다.")
}


// 2. if-esle
if age < 1 {
    print("미성년자")
} else {
    print("성년자")
}


// 3. if-elseif-else
let animal = "pig"

if animal == "dog" {
    print("강아지 사료주기")
} else if animal == "cat" {
    print("고양이 사료주기")
} else {
    print("해당하는 동물 사료가 없음")
}


// 4. switch-case
let color = "red"

switch color {
case "blue":
    print("파란색입니다.")
case "green":
    print("초록색입니다.")
case "yellow":
    print("노란색입니다.")
default:
    print("찾는 색상이 없습니다.")
}



// 5. swift-case 범위 연산자
let temperature = 39
switch temperature {
case -20...9:
    print("겨울입니다.")
case 10...14:
    print("가을입니다.")
case 15...25:
    print("봄입니다.")
case 25...35:
    print("여름입니다.")
default:
    print("이상기후입니다.")
}
