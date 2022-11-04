import UIKit

// 1. 저장형 property
// : 변수(var), 상수(let), struct/class 멤버변수

// 1-1.
struct Dog {
    var name: String
    let gender: String
}

/* *************
 Structure 은, value type (= 값 타입) : let/var instance에 따라 영향 O
 <-> Class 는, reference type (= 참조 타입) : let/var instance 에 따라 영향 X (단, 해당 클래스 내의 let property는 변경 X)
 
 ----------|----------|----------|--------------
 값 변경 O/X |          | instance | property
 ----------|----------|----------|--------------
           |    var   | 값 변경 O  | 값 변경 O
 Structure |----------|----------|--------------
           |    let   | 값 변경 X  | 값 변경 X
 ----------|----------|----------|--------------
           |    var   | 값 변경 O  | 값 변경 O
   Class   |----------|----------|--------------
           |    let   | 값 변경 O -but-> 값 변경 X
 ----------|----------|----------|--------------
 
 >> let (상수) 로 instance 생성시, 값 변경 X
 >> var (변수) 로 instance 생성시, 값 변경 O
 */
var dog = Dog(name: "호텐샤", gender: "Female")
print(dog)

//dog.gender = "Male" // error : let 이어서
dog.name = "손하경"

let dog2 = Dog(name: "호텐샤", gender: "Male")

//dog2.name = "손하경" // error >> structure자체가 value type -> let 으로 선언했기 때문에 변경 X


// 1-2
class Cat {
    var name: String
    let gender: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

let cat = Cat(name: "Hakyung", gender: "Female")
cat.name = "호텐샤" // O
//cat.gender = "Male" // X




// 2. 계산 Property
// - class, structure, enum 에서 사용 가능
// - 값 직접 저장 X -> getter / setter 로 다른 property/value 직접 접근
struct Stock {
    var averagePrice: Int // 평균가격
    var quantity: Int // 양
    var purchasePrice: Int { // 매입가격
        get {
            return averagePrice * quantity
        }
        
        // 1. set 매개변수 이름 지정시
        /*set(newPrice) {
            averagePrice = newPrice / quantity
        }*/
        
        // 2. set 매개변수 이름 지정 X
        // default 매개변수 이름: newValue
        set {
            averagePrice = newValue / quantity
        }
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
print(stock)
stock.purchasePrice
stock.purchasePrice = 3000
stock.averagePrice



// 3. property observer
// : property의 값의 변화 관찰/반영
// - 새로운 값이 기존값과 같더라도, property observer가 호출됨
// - property가 set 될때마다 호출됨
// - 사용 가능한 경우 :
//      1. 저장 property
//      2. overriding이 된 property


// 3-1. 저장 property observer
/*
 (1) willSet
 - 값이 저장되기 직전에 호출됨
 - 새로 저장될 property 값을 상수매개변수 (혹은, default매개변수: newValue) 로 전달
 
 (2) didSet
 - 값이 저장된 직후에 호출됨
 - property 의 기존값을 상수매개변수 (혹은, default매개변수: oldValue) 로 전달
 */
class Accunt {
    var credit: Int = 0 {
        /*
         willSet : pro
         */
        // willSet(setName) : 매개변수 설정도 가능
        willSet { // 매개변수 설정X : default 매개변수 == newValue
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        // didSet(setName)
        didSet { // 매개변수 설정X : default 매개변수 == oldValue
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Accunt()
account.credit = 20000
account.credit = 100




// 4. type property
/*
 - 인스턴스 생성 X, 객체내 property 접근
 - 변수시; 값 변경 가능
 - static 으로 정의
 - 저장 property (var/let), 연산 property (setter/getter) 에서만 사용 가능
 */

struct SomeStructure {
    // 저장 프로퍼티 (변수)
    static var storedTypeProperty = "Some value." // 스토어
    static let storedTypePropertyLet = "Some value." // 스토어
    // 연산 프로퍼티 (getter)
    static var computedTypeProperty: Int { // 컴퓨티트
        return 1
    }
}

SomeStructure.storedTypeProperty
SomeStructure.computedTypeProperty
SomeStructure.storedTypeProperty = "hello"
//SomeStructure.storedTypePropertyLet = "change value" // X
SomeStructure.storedTypeProperty
