import UIKit

// 1. initialize

// 2. De-initialize : 클래스 인스턴스에만 가능!!
// >> instance 가 메모리에서 해제되기 직전에 호출
// >> Class instance 와 관련하여, 정의작업!

class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "Albert"
        self.age = age
    }
    
    deinit {
        print("deinit user")
    }
}

var user = User(nickname: "hakyung", age: 26)
user.nickname
user.age

var user2 = User(age: 20)
user2.nickname
user2.age

var user3: User? = User(age: 23) // optional
user3 = nil
/*
 >> swift 는, 인스턴스가 더이상 필요하지 않을때, 자동으로 메모리 소멸시킴
 >> class instance 에 nil 을 넣으면 -> 더이상 필요X 인스턴스라고 판단
 */
