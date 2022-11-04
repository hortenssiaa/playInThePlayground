import UIKit

/*
 Structure (= 값 type) & Class (= reference(참조) type)
 : 데이터를 용도에 맞게 표현할때 용이
 - property, function 사용
 - 사용자정의 데이터 타입
 */
struct User {
    var nickname: String
    var age: Int
    
    func info() {
        print("\(nickname) \(age)")
    }
}

/*
 Structure 사용하기 위해
 1. 인스턴스 생성
 - >> class, sturcture을 실제 사용하기위해, 메모리에 생성하는것을 뜻함!
 */
var user = User(nickname: "Hakyung", age: 26)

user.nickname
user.age
user.nickname = "Haile" // property value변경
user.nickname

user.info()
