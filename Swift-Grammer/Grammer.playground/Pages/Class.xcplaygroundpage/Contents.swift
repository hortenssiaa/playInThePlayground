import UIKit

class Dog {
    var name: String
    var age: Int
    
    // instance를 사용하기 위한 초기화
    // >> property 초기화
    // >>
    init() {
        
    }
    
    func introduce() {
        print("name: \(name), age: \(age)")
    }
}

var dog = Dog()
dog.age
dog.name
dog.age = 26
dog.name = "내사랑 또또"
dog.age
dog.name

dog.introduce()
