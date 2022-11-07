import Foundation

/*
 * 상속
 - 상속은, Swift에서 다른 타입과 Class를 구별짓는 클래스의 특징
 
 * 베이스 클래스
 - 어떤 클래스도 상속받지 않은 클래스
 
 1. super class의 property -> 서브 클래스에서 재정의 가능
 2. 계산, 저장 프로퍼티 override 한 프로퍼티 : getter/setter 갖을 수 있음
 3. 자식 클래스에서 재정의하려는 property는 supper class의 property의 이름&타입이 일치해야 한다.
 4. super class 에서 read/write로 선언된 propery --X--> sub class에서 read only로 override X
 4.1 super class 에서 read only로 선언된 property는, --O--> sub class에서 read/write 로 override O
 5. super class의 property에 property observer도 추가 가능!
 */


// 1. class 상속, method overriding
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    func makeNoise() {
        print("speaker on..")
    }
}

class Bicycle: Vehicle {
    var hasBasket = false
    
    override func makeNoise() {
        super.makeNoise() // 1
        print("따르릉 따르르릉") // 2
    }
}

var bicycle = Bicycle()
bicycle.currentSpeed
bicycle.currentSpeed = 50.0 // 값 변경 가능
bicycle.currentSpeed

bicycle.makeNoise()



// 2. property overriding
/*
 1) 계산 property, 저장 property 를 override 한 property는,
 --> getter / setter 를 가질 수 있다.
 2) 자식 class에서 재정의하려는 property는,
 --> super class의 property의 타입/이름 일치해야함
 3) super class 에서 read/write로 선언된 propery --X--> sub class에서 read only로 override X
 4) super class 에서 read only로 선언된 property는, --O--> sub class에서 read/write 로 override O
 5) super class의 property에 property observer도 추가 가능!
 */
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description)


// 3, 상속된 property에 property observer 추가!
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet { // currentSpeed 값이 변하면, gear를 변경
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 37.9
print("AutomaticCar: \(automatic.description)")



/* *******
 - 상수 저장 property & read only 연산 property
 >> property observer 추가 X (willSet / didSet)
 >> let or read only에는 값 설정 X 때문에
 
 + final 추가시,
 메소드 / property / class -> override 못함
 */

