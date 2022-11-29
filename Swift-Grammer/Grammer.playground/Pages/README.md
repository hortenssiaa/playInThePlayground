# 🥗  Swift Grammer
### Contents 🗂
: Click & see a quick overview of Swift grammer!🤓

1. [Basic Data Type](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#1-basic-data-type-code)
2. [Collection](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#2-collection-code)
3. [Function](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#3-function-code)
4. [Conditional Statement](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#4-conditional-statement-code)
5. [Repetitive Statement](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#5-repetitive-statement-code)
6. [Optional](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages/#6-optional-code)
- 6.1. [Optional Binding](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#61-optional-binding-code)
- 6.2. [Optional Chaining](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#62-optional-chaining-code)
7. [Structure](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#7-structure-code)
8. [Class](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#8-class-code)
- 8.1. [Comparison of Structure & Class](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages/#81-comparison-of-structure--class)
9. [Property](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#9-property-code)
10. [Class inheritance](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#10-class-inheritance-code)
11. [Assert & guard](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#11-assert--guard-code)
12. [Protocol](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#12-protocol-code)
13. [Extension](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#13-extension-code)
14. [Enum](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#14-enum-code)
15. [try-catch](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#15-try-catch-code)
16. [Closure](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#16-closure-code)
17. [Map, Filter, Reduce](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#16-closure-code)

----
<br>


### 1. Basic Data Type ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Basic%20Data%20Type.xcplaygroundpage/Contents.swift))
    • Int, UInt
    • Float, Double
    • Bool
    • Character, String
    • Any
----
<br>

### 2. Collection ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Collection.xcplaygroundpage/Contents.swift))
#### 2.1 **Array**
  - 기본형
    ```swift
    var numbers: Array<Int> = Array<Int>()
    ```
  - 축약형
    ```swift
    var numbers: [Int] = []
    var numbers: [Int]
    ```
<br>

#### 2.2 **Dictionary**
  - 기본형
    ```swift
    var dictionary: Dictionary<String, Int> = Dictionary<String, Int>()
    ```
  - 축약형
    ```swift
    var dictionary: [String, Int] = [:]
    var dictionary2: [String, Any] = [:]
    var dictionary3: [String, Int] = ["Hakyung", 01]
    ```
<br>

#### 2.3 **Set**
  - only 기본형
    ```swift
    var set: Set<Int> = Set<Int>()
    ```
<br>

\ | Array | Set 
:---:|:---:|:---:
`값 중복` | O | X
`순서` | O | X

----
<br>



### 3. Function ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Function.xcplaygroundpage/Contents.swift))
: Swift는 함수형 프로그래밍 패러다임을 포함한, 다중 패러다임을 포함한 언어
- 함수는? 1급 객체
- 함수를? 변수(var) / 상수(let) 등에 할당 가능
- 함수를? 매개변수를 통해 전달 가능
<br>

#### 3.1 **매개변수 기본값 세팅**
```swift
func greetings(friend: String, me: String = "Hakyung") {
  print("Hello \(friend), I'm \(me).")
}
    
greetings(friend: "Albert") 
// Hello Albert, I'm Hakyung.

greetings(friend: "Ken", me: "호텐샤") 
// Hello Ken, I'm 호텐샤.
```
<br>

#### 3.2 **전달인자 Lable (feat. from, to)**
- 매개변수의 역할을 명확하게 표현 가능
- 코드 가독성 높아짐!
```swift
func sendMessage(from myName: String, to name: String) -> String {
  return "Hello \(name)! I'm \(myName)."
}

sendMessage(from: "Hakyung", to: "Ken")
// Hello Ken! I'm Hakyung.
```
<br>

#### 3.3 **전달인자 Lable 사용하고싶지 않다면? → wild card _ 사용**
```swift
func sendMessage(_ name: String) -> String {
    return "Hello, \(name)"
}

sendMessage("손하경")
// Hello, 손하경
```
<br>

#### 3.4 **가변 매개변수**
- 몇개의 매개변수가 들어올지 모를때, ... 으로 표현
- 0개 이상의 매개변수 가능. 
- 가변매개변수로 받은 값은, 배열 [ ] 로써 사용 가능!
    > 예) Hello ["Jake", "Ken", "Anne", "Tiffany"], I'm Hakyung"
```swift
func sendMessage(me: String, friends: String...) -> String {
    return "Hello \(friends), I'm \(me)"
}

sendMessage(me: "Hakyung", friends: "Jake", "Ken", "Anne", "Tiffany")
// Hello ["Jake", "Ken", "Anne", "Tiffany"], I'm Hakyung"
```
<br>

----
<br>


### 4. Conditional Statement ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Conditional%20Statement.xcplaygroundpage/Contents.swift))

#### 4.1 **if-else**
```swift
let animal = "pig"

if animal == "dog" {
    print("미성년자")
} else if animal == "cat" {
    print("고양이 사료주기")
} else {
    print("해당하는 동물 사료가 없습니다.")
}

// 해당하는 동물 사료가 없습니다.
```
<br>

#### 4.2 **switch-casee**
```swift
let color = "pink"

switch color {
case "blue":
    print("파란색입니다.")
case "green":
    print("초록색입니다.")
case "pink"
    print("핑크색입니다.")
default:
    print("찾는 색상이 없습니다.")
}

// 핑크색입니다.
```
<br>

#### 4.3 **swift-case 범위 연산자**
```swift
let temperature = 39

switch temperature {
case -20...9:
    print("겨울입니다.")
case 10...14:
    print("가을입니다.")
case 15...25:
    print("봄입니다.")
case 26...35:
    print("여름입니다.")
default:
    print("이상기후입니다.")
}

// 이상기후입니다.
```
<br>

----
<br>


### 5. Repetitive Statement ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Repetitive%20Statement.xcplaygroundpage/Contents.swift))

#### 5.1 **for-in**
```swift
for i in 1...4 {
    print("i: \(i)")
}

// i: 1
// i: 2
// i: 3
// i: 4
```
<br>

#### 5.2 **while**
```swift
var number = 3

while number < 5 {
    number += 1
}
number // 5
```
<br>

#### 5.3 **repeat-while (== do-while)**
```swift
var x = 6

repeat {
    x += 2
} while x < 5

print("x: \(x)") 
// x: 8
```
<br>

----
<br>


### 6. Optional ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Optional.xcplaygroundpage/Contents.swift))
: 값이 있을수도~ 없을수도(nil)~ 있다.
- 초기값? nil
- Swift / 일반 프로그래밍 언어 차이
  - Swift
    - 안정성이 장점!
    - optional 사용시, nil에 접근해도 → 프로그램 종료 X
  - 일반 프로그래밍 언어
    - 값이 null에 접근시, run time error → 프로그램 종료 O

<br>

```swift
var name: String?

var optionalName: String? = "Hakyung"
print(optionalName) 
// Optional("Hakyung")

var requiredName: String = optionalName // X (optional unrapped error)
```
<br>


----
<br>

### 6.1. Optional Binding ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Optional%20Bind.xcplaygroundpage/Contents.swift))
: optional 포장지 벗겨서 값 갖고오는
1. 명시적 해제 (binding)
- 강제 해제
- 비강제 해제

2. 묵시적 해제 (binding)
- 컴파일러에 의한 자동해제
- 옵셔널의 묵시적 해제
<br>

#### 6.1.1 **optional 강제해제**
- ! 사용
- 아주 위험! → 프로그램 강제종료
  > nil 강제 해제시 
```swift
var number: Int? = 3

print(number)
// Optional(3)
print(number!)
// 3 (아주 위험)
```
<br>


#### 6.1.2 **optional 비강제해제 (if-else)**
- optional을 추출해서, 할당받을 변수(상수) 설정
  > result
- if-else으로..
  - optional값이 잘 추출 됐으면 → if 문 실행
  - optional값이 nil이면 → else 문 실행
- if-else 문으로 추출시;
  - 변수/상수는 if-else문 내에서만 사용 가능
  - 안전함!
```swift
var number: Int? = nil

if result = number { // optional 추출 성공
    print(result) // optional 추출값 
} else { // fail
    print("optional binding fails")
}

// optional binding fails
```
<br>

#### 6.1.3 **optional 비강제해제 (guard)**
- guaurd 문으로 추출시;
  - guard 다음으로 오는 함수 전체에서 사용 가능!
  - 안전함! 
```swift
func test() {
    let number: Int? = 3
    guard let result = number else { return }
    print(result)
}

test()
// 3
```
<br>


#### 6.1.4 **optional 자동해제 by compiler**
- optional 값을 비교연산자 (==, <, >, etc.)로 비교시
  - 딱 그때만! 컴파일러가 자동으로 optional값 해제시킴
```swift
let value: Int? = 3

if value == 6 { // 비교시! 딱 이때만
    print("value가 6입니다.")
} else {
    print("value가 6이 아닙니다.")
}
```
<br>


#### 6.1.5 **optional 묵시적 해제**
- 값이 nil일수도, 아닐 수도 있을 경우
  - nil이 아닌경우, 묵시적 해제됨
    > 예) Int("12")
    > 
    > 예) Int("12a")
```swift
let string = "12"

var stringToInt: Int? = Int(string) 
// Int(string) 값이 nil일수도, Int형이 될수도 있으니 -> Optional

print(stringToInt + 1)
```
<br>


----
<br>


### 6.2. Optional Chaining ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Optional%20Chaining.xcplaygroundpage/Contents.swift))




<br>


----
<br>




### 7. Structure ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Structure.xcplaygroundpage/Contents.swift))
Structure (= value(값) type) & Class (= reference(참조) type)
- 데이터를 용도에 맞게 표현할 때 용이 
- property, function 사용
- 사용자정의 data type
- Structure 사용하기 위해서?
    1. 인스턴스 생성
       > class, structure을 실제로 사용하기 위해 , 메모리에 생성하는 것을 뜻함!
<br>

```swift
struct User {
    var nickName: String
    var age: Int
    
    func info() {
        print("\(nickName) \(age)")
    }
}

var user = User(nickName: "hortenssiaa", age: 25)

user.nickName = "niki" // property value 변경됨!
user.info() // niki 25
```


----
<br>



### 8. Class ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Class%20init.xcplaygroundpage/Contents.swift))
Structure (= value(값) type) & Class (= reference(참조) type)
- 데이터를 용도에 맞게 표현할 때 용이 
- property, function 사용
- init (initialize)
    - 인스턴스 사용하기 위한 초기화
       > property를 초기화한다!
- de-init
    - Class instance에만 de-init 가능 
    - Swift는, instance 가 더이상 필요하지 않을때 → 자동으로 메모리 소멸시킴!
    - Class instance 에 nil 을 넣으면 → 더이상 필요X instance 라고 판단
        > user3 = nil
         1. instance 가 메모리에서 해제되기 직전에 호출
            > deinit { }
         2. class instance와 관련하여, 정의작업!
<br>

```swift
class User {
    var nickname: String
    var age: Int
    
    init(nickname: String, age: Int) {
        self.nickname = nickname
        self.age = age
    }
    
    init(age: Int) {
        self.nickname = "Hortenssiaa"
        self.age = age
    }
    
    deinit {
        print("deinit user")
    }
    
    func introduce() {
        print("nickname: \(nickname), age: \(age)")
    }
}

var user = User(nickname: "hakyung", age: 25)
user.nickname // hakyung
user.age // 25

var user2 = User(age: 26)
user2.nickname // Hortenssiaa
user2.age // 26

var user3: User? = User(age: 23) // optional
user3 = nil // deinit user
```

<br>


----
<br>





### 8.1. Comparison of Structure & Class

#### 8.1.1 **Structure & Class 공통점**
- 변수(var), 상수(let) property 선언 가능
- function (메서드) 선언 가능
- 내부 값에 . 을 사용하여 접근 가능
- 생성자 사용하여 초기값 설정 가능
- extension을 사용하여 기능 확장 가능!
- propocol 채택하여 기능 설정 가능!

<br>

#### 8.1.2 **Structure & Class 차이점**
***1. Class 클래스***
- 참조타입 (reference type)
    - 메모리 스택 영역 ← instance 메모리 주소 할당 (= 포인터) 
    - 힙 영역 ← 실제 데이터 할당
      > 힙 영역에 저장되기 때문에, ARC로 메모리를 관리한다.
    - 같은 class instance 를 여러개 할당시;
        - 하나의 instance만 가리키는 메모리 주소가 복사되어
        - → 값 변경시, 모든 변수에 영향!
- 상속 가능!
- Type casting을 통해, 
    - run-time시 class instance의 타입 확인 가능
- deinit 사용 가능
    - class instance 의 메모리 할당 해제 가능

```swift
class SomeClass {
    var count: Int = 0
}

var class1 = SomeClass()
var class2 = class1
var class3 = class2
var class4 = class2

class3.count = 100 
class1.count // 100
class2.count // 100
class3.count // 100
class4.count // 100
```


<br>

***2. Structure 구조체***
- 값타입 (value type)
    - 변수 할당시; 
        - 스택 영역 ← 값 저장
        - ARC로 메모리 관리 X
    - 같은 structure instance 를 여러개에 할당시; 
        - 새로운 structure instance가 할당됨
          > (= 새로운 메모리가 계속 할당됨)
        - 즉, 값 변경해도 다른 구조체 변수에 영향 X
- 상속 불가능!

```swift
struct SomeStruct {
    var count: Int = 0
}

var struct1 = SomeStruct()
var struct2 = struct1
var struct3 = struct2
var struct4 = struct1

struct1.count = 101
struct2.count = 102
struct3.count = 103
struct4.count = 404

struct1.count // 101
struct2.count // 102
struct3.count // 103
struct4.count // 404
```


<br>


----
<br>




### 9. Property ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Property.xcplaygroundpage/Contents.swift))
1. 저장형 property
2. 계산 property
3. property observer
    > willSet, didSet
    1. 저장 property observer
    2. overriding 된 property
4. type property
<br>


#### 9.1 **저장형 property**
- 변수(var), 상수(let), struct/class 멤버변수
    - Structure은, value(값) type → let / var instance에 따라 영향 O !!!
    - ↔️ Class는, reference(참조) type → 영향 X ! 
        > but, 해당 클래스 내의 property의 let/var 에 따라 영향 O 

<br>

변수 / 상수 | 구조체 / 클래스 | `instance` | `property` 
:---:|:---:|:---:|:---:
***var*** | `Structure` | 값 변경 O | 값 변경 O
***let*** | `Structure` | X | X
***var*** | `Class` | O | O
***let*** | `Class` | O | X

   > let (상수)로 instance 생성시, 
   > >var property: 값 변경 O
   > >
   > >let property: 값 변경 X
   
   > var (변수)로 instance 생성시, 값 변경 O

<br>

```swift
// ex-Structure 1)
struct Dog {
    var name: String
    let gender: String
}

// ex 1.1) 
var dog = Dog(name: "Ttotto", gender: "Male")
print(dog) 

dog.name = "Tetti"
dog.gender = "Female" // error -> gender은 let property!

// ex 1.2)
let dog2 = Dog(name: "Purry", gender: "Female")

dog2.name = "hakyung" // error -> dog2는 let instance!


// ex-Class 2)
Class Cat { 
    var name: String
    var gencer: String
    
    init(name: String, gender: String) {
        self.name = name
        self.gender = gender
    }
}

// ex 2.1)
let cat = Cat(name: "Hotkong", gender: "Female")
cat.name = "tensha" // 변경 O
cat.gender = "male" // X (error) -> Class는 let instance여도 변경가능하지만, gender은 let property !!!
```
<br>
<br>



#### 9.2 **계산 property**
- class, structure, enum 에서사용 가능!
- property에 getter / setter
    - 값 직접 저장X
        > → getter/setter로 property/value 직접 접근!
        1. set 매개변수 이름 지정시
        ```swift
            set(newPrice) {
                averagePrice = newPrice / quantity
            }
        ```

        2. set 매개변수 이름 지정 X
            - default 매개변수 이름: ***newValue*** !!!!
        ```swift
            set {
                averagePrice = newValue / quantity
            }
        ```
- private(set) 이란?
    - 외부에서는 getter(읽기)만 가능하고, 
    - 내부에서는 setter/getter (읽기쓰기) 다 가능하게 
        ```swift
            @Published private(set) var user: UserProfile
        ```

<br>

```swift
struct Stock {
    var averagePrice: Int
    var quantity: Int
    var purchasePrice: Int {
        get {
            return averagePrice * quantity
        }
        
        set {
            averagePrice = newValue / quantity
        }
    }
}

var stock = Stock(averagePrice: 2300, quantity: 3)
stock.purchasePrice = 3000 // O
```
<br>
<br>




#### 9.3 **property observer**
- property 의 값의 변화를 관찰 & 반영
- 새로운 값이 기존값과 같더라도, 변화시 property observer 호출됨!
    - property가 set 될때마다 호출됨
- 사용 가능한 경우:
    1. 저장 property
    2. overriding 된 property

<br>


##### 9.3.1 **저장 property**
1. willSet
    - 값이 저장되기 직전에 호출됨
    - 새로 저장될 property 값을 상수매개변수로 전달
      > (혹은, default매개변수 : newValue) 

<br>

2. didSet
    - 값이 저장된 직후에 호출됨
    - property 의 기존값을 상수매개변수로 전달
      > (혹은, default매개변수 : oldValue)

```swift
class Account {
    var credit: Int = 0 {
        // willSet(setName) {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        // didSet(setName) {
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

var account = Account()
account.credit = 20000
// 잔액에 0원에서 20000원으로 변경될 예정입니다.
// 잔액이 0원에서 20000원으로 변경되었습니다. 
```
<br>



#### 9.4 **type property**
- static 으로 정의!
- instance 생성 X 
    - → 객체내 property에 접근
- static 변수(var)시, 값변경 가능 !
- 저장 property (var/let), 연산 property (setter/getter) 에서만 사용 가능

<br>

```swift
struct SomeStructure {
    // 저장 property 
    static var storedTypeProperty = "Some value."
    static let storedTypeProperty_Let = "Some value."
    
    // 연산 proiperty (getter)
    static var computedTypeProperty: Int {
        return 1
    }
}

SomeStructure.storedTypeProperty = "hello" // O
SomeStructure.storedTypeProperty_Let = "Change value!!!" // X
```


<br>



----
<br>




### 10. Class Inheritance ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Inheritance.xcplaygroundpage/Contents.swift))
: 상속은, Swift에서 Class와 다른타입을 구별짓는 클래스의 특징!
- Super class의 property 
    - → Sub class에서 재정의 가능
- Base Class
  > 어떤 클래스도 상속받지 않은 클래스


<br>

#### 10.1 **Class & method overriding**
```swift
Class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    func makeNoise() {
        print("speaker on..")
    }
}

Class Bicycle: Vehicle {
    var hasBasket: Bool = false
    
    override func makeNoise() {
        super.makeNoise() // no.1
        print("따르릉 따르릉~") // no.2
    }
}

var bicycle = Bicycle()
bicycle.currentSpeed // 0.0
bicycle.currentSpeed = 50.0 // 값 변경 가능
bicycle.currentSpeed // 50.0

bicycle.makeNoise()
// spaeker on..
// 따르릉 따르릉~
```

<br>


#### 10.2 **Property overriding**
1. 걔산, 저장 property를 override 하면
   > setter / getter 가질 수 있음!
2. Sub class에서 재정의하려는 Super class의 property
   > 타입 & 이름 일치해야함!
3. Super class의 read/write property
   > sub class에서 read only 로 override (X)
4. Super class의 read only property
   > sub class에서 read/write 로 override (O)

   
<br>

```swift
Class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    func makeNoise() {
        print("speaker on..")
    }
}

Class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 30.0
car.gear = 2
print(car.description) // traveling at 30.0 in gear 2
```

<br>


#### 10.2 **상속한 property에 property observer 추가!**
- Super class의 property 오버라이드시!
   > property observer 추가 가능!
   
<br>

```swift
Class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed)"
    }
    
    func makeNoise() {
        print("speaker on..")
    }
}

Class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}

let auto = AutomaticCar()
auto.currentSpeed = 39.4 // gear == 4
print("AutomaticCar: \(auto.description)")
// AutomaticCar: traveling at 39.4 in gear 4
```

<br>



----
<br>



### 11. Assert & guard ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Assert%20%26%20guard.xcplaygroundpage/Contents.swift))







<br>


----
<br>




### 12. Protocol ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Protocol.xcplaygroundpage/Contents.swift))







<br>


----
<br>



### 13. Extension ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Extension.xcplaygroundpage/Contents.swift))



<br>


----
<br>




### 14. Enum ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Enum.xcplaygroundpage/Contents.swift))



<br>


----
<br>





### 15. try-catch ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/try-catch.xcplaygroundpage/Contents.swift))



<br>


----
<br>







### 16. Closure ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Closure.xcplaygroundpage/Contents.swift))



<br>


----
<br>






### 17. Map, Filter, Reduce ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Map%2C%20Filter%2C%20Reduce.xcplaygroundpage/Contents.swift))



<br>


----
<br>
