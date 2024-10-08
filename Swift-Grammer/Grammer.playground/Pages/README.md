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
17. [Map, Filter, Reduce](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#17-map-filter-reduce-code)
18. [Typecasting](https://github.com/hortenssiaa/playInThePlayground/tree/master/Swift-Grammer/Grammer.playground/Pages#18-typecasting)

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
    var numbers = [Int]()
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
  - only 기본형 (축약형 X)
    ```swift
    var set: Set<Int> = Set<Int>()
    var set: Set<Int> = []
    var set = Set<Int>([2, 3, 4, 5])
    ```
<br>

\ | Array | Set 
:---:|:---:|:---:
`값 중복` | O | X
`순서` | O | X

----

### tuple
- 여러 데이터를 하나의 값으로 표현
- 세부 데이터 접근시, 포지션(index 번호) 또는 이름으로 접근 가능
    ```swift
    var phone = (os: "iOS", model: "iPhone13")

    phone.0 // 'iOS'
    phone.os // 'iOS'
    ```


### enum
- 서로 관계있는 값들을 모아서 표현한 것이 enum
- 특정 타입들을 표시할때 사용하기 좋음
  ```swift
  // 요일을 enum 으로 만들어보기 
  enum WeetDay {
      case mon
      case tue
      case wed
      case thu
      case fri
  }

  var today: WeekDay = .mon


  // 미디어 타입을 enum으로 만들어보기
  enum MediaType {
      case audio
      case video
  }

  var mediaType: MediaType = .audio
  ```

  #### * associated value(연관값)을 갖고있는 형태 표현
  ```swift
  enum MediaType {
      case audio(String)
      case video(String)
  }

  var mp3: Mediatype = .audio("mp3")
  var h264: Mediatype = .video("h264")
  ```


  #### * enum 표시시, 값을 할당하여 표시하는 경우
  - Int 타입의 경우, case의 순서대로 (위에서 부터) 0부터 시작
  - String 의 경우, case 이름을 따르거나, 새로 지정할 수 있음
  ```swift
  enum MasterLevel: Int {
      case beginner
      case intermediate
      case professional
  }

  let pro = MasterLevel(rawValue: 2) // case professional
  let otherLevel = MasterLevel(rawValue: 5) // -> nil


  enum Direction: String {
      case up
      case down = "ddd"
  }

  let up = Direction(rawValue: "up")
  let otherDirection = Direction(rawValue: "left") // -> nil
  
  ```

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
  - if let 을 이용해서 unwrapping 함!
  - 변수/상수는 if-else문 내에서만 사용 가능
  - 안전함!
```swift
var number: Int? = nil

if let result = number { // optional 추출 성공 (실제 값이 있는 경우만 if 문을 타게 된다) 
    print("number: \(result)") // optional 추출값 
} else { // fail
    print("number is missing.")
}

// optional binding fails
```
<br>

#### 6.1.3 **optional 비강제해제 (guard)**
- guard 문으로 추출시;
  - guard let 을 이용하면, 메소드 초기에 옵셔널 타입에서 값이 있는 경우를 검사할 수 있음
  - guard 다음으로 오는 함수 전체에서 사용 가능!
  - 안전함! 
```swift
let number: Int? = nil
number = 33
func printNumber() {
    guard let unwrapped = numbre else {
        print("number is missing")
        return
    }
    print("numer: \(number)")
}

printNumber() // 33
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


#### 6.1.6 **optional coalescing**
- optional 타입에 값이 있는 경우는, 해당 값을 넘겨주고
- optional 타입에 값이 없는 경우는, default값으로 nil coalescing 을 이용하여 설정할 수 있음
  - ?? 을 이용해서 default 값 설정해줌
```swift
let age: Int? = nil
let getAge = age ?? 30 // 30

age = 10
let getAge2 = age ?? 30 // 10
```
<br>


----
<br>


### 6.2. Optional Chaining ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Optional%20Chaining.xcplaygroundpage/Contents.swift))
: optional에 속해있는 nil일지도 모르는 property, method, subscription 등을 가져오거나 / 호출할때 사용할 수 있는 일련의 과정
```
💡 정리
  >> Optional binding 없이, optional chaining 사용시, 값에 쉽게 접근 가능!
```

- ! 또는 ? 로 property / method 등을 접근
- property / method 등에 값이 있다면, 해당값을 반환
  > 값이 없다면, nil 을 반환!
  
<br>

```swift
struct Developer { 
    let name: String
}

struct Company {
    let name: String
    var developer: Developer? // 개발자는 있을 수 도, 없을 수 도 있다.
}

var developer = Developer(name: "Miel")
var company = Company(name: "Apple", developer: developer)
print(company.developer) // Optional(__lldb_xxxxx.Developer(name: "Miel"))

print(company.developer?.name) // company.developer은, optional type이기 때문에
                                // optional을 벗겨내고 name에 접근해!
print(company.developer!.name)
/* **
    - 이전방식으로 optional binding하여 값 접근 가능하지만, 
       >> optional chaining을 사용하여 값 접근 가능!
       
    
** */

```
- ? 을 사용하여 optional Chainging 시;
  > 접근한 property의 값은 항상 optional에 감싸져 있음 (값이 nil 일수도 있어서)
     >>    -> 따라서, optional 벗겨내고싶으면, optional binding 사용하면 됨!
          
- ! 을 사용하여 optional Chaining 시;
  > optional property 를 강제 unmapping 하여 접근 -> optional 에 감싸있지 X

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


#### 11.1 **assert**
- assert 함수는, 디버깅 모드에서만 동작
  > 주로, 디버깅중 조건의 검증을 위해 사용!
- 특정 조건을 체크하고, 조건이 성립되지 않으면 -> 메세지를 출력하게 할 수 있는 함수

   
<br>

```swift
var value = 0
assert(value == 0)

value = 2
assert(value == 0, "값이 0이 아닙니다")
// 조건 불만족시, error 발생 + 메세지 출력 (= runtime error)
// __lldb_expr_37/Assert & guard.xcplaygroundpage:26: Assertion failed: 값이 0이 아닙니다
```

<br>


#### 11.2 **guard**
- 함수 내에서 사용
- 조건을 검사하여, 그 다음 코드를 실행할지 말지 결정한다
- guard 문에 주어진 실행코드는, 조건이 거짓일때 실행!


<br>

```swift
func guardTest(value: Int) {
    guard value == 0 else {
        print("value is not 0, but (\value)")
        return
    }
    print("Value is \(value)")
}

guardTest(value: 2) // value is not 0, but 2
guardTest(value: 0) // value is 0
```


<br>

#### 11.2.2 **guard문으로, optional 포장지 벗기기**
- (= optional binding)
- optional binding 값은, 조건문(guard문) 밖에서도 사용 가능!


<br>

```swift
func guardOpBindTest(value: Int?) {
    guard let value = value else {
        // 매개변수 value가 optional이니깐, 값이 있으면 상수 value에 넣고, 
        // nil이면 error니깐 아래 코드 실행
        print("guardOpBindTest: value is \(value)")
        return
    }
    print("guardOpBindTest: Value is \(value)") // guard문을 통한 optional binding 값
}

guardOpBindTest(value: 0) // guardOpBindTest: Value is 0
guardOpBindTest(value: nil) // guardOpBindTest: value is nil
guardOpBindTest(value: 2) // guardOpBindTest: Value is 2
```


<br>


----
<br>




### 12. Protocol ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Protocol.xcplaygroundpage/Contents.swift))
: 특정 역할을 하기 위한 요구사항의 청사진 (계획/구상)
- Structure, Class, Enum 에서 protocol 채택 가능
  > protocol의 요구사항을 실제 구현시;
  > > protocol의 요구사항을 모두 충족하면, 채택한 protocol을 준수한 것이다.
- 특정 역할을 위한 요구사항 : method, property, init 등

<br>


#### 12.1 **Structure**

```swift
protocol SomeProtocol {
    // property : property 이름, type만 지정!
    var name: String { get set } // 읽기 & 쓰기전용
    var age: Int { get } // 읽기전용
    
    // >> SomeProtocol protocol을 채택한 타입에게, name property는 읽기&쓰기로 실제구현을 준수해라!
    // >> age property는 읽기전용 실제구현을 준수해라!
}


protocol SomeProtocol2 {
}
```

```swift
// 여러개의 protocol 채택 가능
struct SomeStructure: SomeProtocol, SomeProtocol2 {
    var name: String
    var age: Int
}
```


<br>




#### 12.2 **Class**
- class에서, protocol & 부모 클래스 상속시; 
  > 상속받을 Class를 제일 먼저 작성 -> 그리고, protocol 순서
- class에서, protocol init 요구사항 실현시! 
  > required init() { } 
  >> struct (구조체) 에서는, required 필요 X 
- final Class인 경우, 상속받지 못하므로!
  > required 필요 X

<br>

```swift
protocol FullyNames {
    var fullName: String { get set }
    
    // 1. method 요구사항
    /*
        - instance method, type method 모두 가능
        - 매개변수는 지정 불가!
    */
    func printFullName()
    
    // 2. init 요구사항
    /*
        - init 종류
        - (1). init()
        - (2). init(매개변수)
    */
    init(fullName: String)
}

protocol InitTestProtocol {
    init()
}
```


<br>

```swift
class initTestClass: InitTestProtocol {
    required inti() {
    
    }
}

class Person: FullyNames {
    var fullName: String
    
    func printFullName() {
        print(fullName)
    }
    
    required init(fullName: String) {
        self.fullName = fullName
    }
}
```

<br>

----
<br>



### 13. Extension ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Extension.xcplaygroundpage/Contents.swift))
: 기존에 정의되어있는 Class, struture, enum, protocol에 새로운 기능을 추가할 수 있는 기능
```swift
/* 작성예시 */
extension 타입이름 {
    // 추가기능
}
```


#### 13.1 **추가 가능한 기능**
- 연산 타입 property
  > 예) 짝수/홀수 계산 property
- 연산 instant property
- 타입 method / instant method
- init (initialize)
- subscript
- 중첩 타입
- 특정 protocol을 준수할 수 있도록 기능 추가 가능!

<br>

💡Extension으로 새로운 기능을 추가할 수 있지만, ***기존에 존재하는 기능을 override 할 수는 없음!***

<br>

```swift
extension Int {
    var isEven: Boole {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

let number = 3
number.isOdd // true
number.isEven // false
```

<br>

```swift
extension String {
    func convertToInt() -> Int? {
        return Int(self)
    }
}

let str1 = "100"
let str2 = "13s"

str1.convertToInt() // 100
str2.convertToInt() // nil
```

<br>


----
<br>




### 14. Enum ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Enum.xcplaygroundpage/Contents.swift))
: 서로 관계있는 것들을 -> 모아서 -> 표현한 것
- 특정 타입을 표시할 때 좋음
- 하나의 새로운 타입으로 사용 가능
- String으로 적어도 되지만, 에러를 방지하기 위해 미리 만들어줌
  > 예) today = "mon" (o), "mom" (x) -> 시간이 지난 후 오타 발견때까지 알기 어려움


<br>

#### 14.1 예1) 요일, 미디어타입을 enum으로 만들기

```swift
// 1. 요일
enum WeekDay {
    case mon
    case tue
    case wed
    case thu
    case fri
}

let today: WeekDay = .mon // WeekDay.mon 이라는 뜻


// 2. 미디어타입
enum MediaType {
    case audio
    case video
}

let mediaType: MediaType = .audio
```



<br>

#### 14.2.1 예2) enum + associated value(연관값)
- associated value를 갖고있는 형태로 표현 가능!

```swift
enum MediaType2 {
    case audio(String)
    case video(String)
}

// audio, video 라는 큰 틀은 있고, 
// 이 안에도 많은 확장자가 있으니, 받을때 같이 받으면 좋은 예시
var mp3: MediaType2 = .audio("mp3")
var h264: MediaType2 = .video("h264")

print("\(mp3), \(h264)") // audio("mp3"), video("h264")
```



<br>

#### 14.2.2 ⭐️ 연관값 추측 : if / switch문 활용 ⭐️

```swift
enum PhoneError {
    case unknown
    case batteryLow(String)
}

let error: PhoneError = .batteryLow("배터리가 곧 방전됩니다.")

// 연관값 추측
switch error {
    case .batteryLow(let message): // 연관값을 넘겨받도록 상수 message 선언
        print(message) // 배터리가 곧 방전됩니다.
    case .unkown:
        print("알 수 없는 에러입니다.")
}
```


<br>

#### 14.3 예3) 나침판 - ***rawValue 사용***
- 하나의 새로운 타입으로 사용 가능
- 열거형의 각 항목(case)는, 자체로 한 값이지만, 항목이 원시값(초기값)을 특정타입으로 갖게 할 수도 있다!
  > 예) CompassPoint: String, case north = "북"

```swift
enum CompassPoint: String { // case의 타입을 String으로 정해줌!
    case north = "북"
    case south = "남"
    case east = "동"
    case west = "서"
    // same with -> case north, south, east, west
}

var direction = CompassPoint.east // east
direction = .north // north

// ⭐️원시값을 사용하고 싶다면?⭐️
print(direction.rawValue) // "북"

switch direction {
    case .north:
        print(direction.rawValue) // "북"
    case .south:
        print(direction.rawValue)
    case .east:
        print(direction.rawValue)
    case .west:
        print(direction.rawValue)
}

// 원시값으로 열거형 항목값 변경도 가능!
// But, 해당 원시값이 없으면, nil
let direc = CompassPoint(rawValue: "서") // west
let direc2 = CompassPoint(rawValue: "북북") // nil
```


<br>


----
<br>





### 15. try-catch ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/try-catch.xcplaygroundpage/Contents.swift))
: == 애러처리
- 프로그램 내에서 에러가 발생한 상황에 대해, 대응 & 복구하는 과정
- Swfit에서는, run-time error발생시 처리하기 위한 방법
    - 발생 (throwing)
    - 감지 (catching)
    - 전파 (propagating)
    - 조작 (manipulating)
- Swift 에서의 에러처리는, error protocol을 따르는 type의 값으로 표현된다.
  - error protocol은, 요구사항이 없는 빈 프로토콜 이지만,
    > 오류를 표현하기 위해 채택해야함!
  - enum(열거형)은, 오류의 원인을 나누고
    - 해당 오류의 특성에 대한 추가정보를 제공하는 모델을 만드는데 적합함!
      > swift에서는, enum을 통해 error의 종류를 표현하는게 가장 일반적!

<br>


#### 15.1. error protocol 채택한 열거형
```swift
enum PhoneError: Error {
    case unknown
    case batteryLow(batteryLevel: Int)
}
```

<br>


#### 15.2.1 *(throw)* 오류 던지기
```swift
throw PhoneError.batteryLow(batteryLevel: 20)
//Playground execution terminated: An error was thrown and was not caught:
//▿ PhoneError
//  ▿ batteryLow : 1 element
//    - batteryLevel : 20
```

<br>

#### 15.2.2 *(throw)* 함수에서 발생한 오류를 -> 해당함수를 호출한 코드에 전파 
```swift
func checkPhoneBateryStatus(batteryLevel: Int) throws -> String {
    guard batteryLevel != -1 else { throw PhoneError.unknown }
    guard batteryLevel > 20 else { throw // 20 이하일때
        PhoneError.bateryLow(batteryLevel: 20)
    } 
    return "배터리 상태가 정상입니다."
}
```

<br>

#### 15.3 *(do(try)-catch)* throw method 사용하기
: throw method는 에러를 반환할 수 있으니 
  > do-catch / try? / try! 로 오류 처리하기!
- catch 블록 내의 지역상수 error
  > catch 블록에는, 오류의 종류를 명시하지 않아도, 암시적으로 error라는 이름의 지역상수에 오류내용이 들어오게됨! 

<br>

```swift
do {
    try checkPhoneBateryStatus(batteryLevel: 20)
} catch PhoneError.unknown {
    print("알 수 없는 에러입니다.")
} catch PhoneError.batteryLow(let betLevel) { // 연관값을, 상수 batLevel로 전달받게 함 
    print("배터리 전원 부족 남은 배터리: \(betLevel)")
} catch { // 그 외의 모든 오류 
    print("그 외의 오류: \(error)
}
```

<br>


#### 15.4 *(try?)* optional 값으로 오류 처리하기!
- 오류를 optional 값으로 반환하여, 처리하기!
- 오류일 경우에는; 값은 nil 반환 

<br>

```swift
var status = try? checkPhoneBateryStatus(batteryLevel: -1) // nil
status = try? checkPhoneBateryStatus(batteryLevel: 20) // nil
status = try? checkPhoneBateryStatus(batteryLevel: 30) // Optional("배터리 상태가 정상입니다.")
print(status)
```



<br>


#### 15.5 *(try!)* 오류가 발생하지 않을것이라고 확신하기!
- 오류가 절대로 일어나지 않을것이라고 확신할때 사용 
  > 안그러면, run-time error -> 프로그램 강제 종료됨!  

<br>

```swift
var status2 = try! checkPhoneBateryStatus(batteryLevel: 30) // 배터리 상태가 정상입니다.
print(status2) 
```



<br>



----
<br>







### 16. Closure ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Closure.xcplaygroundpage/Contents.swift))
- 참조 type
- 코드에서 전달 / 사용할 수 있는 독립기능의 블록
- 일급 객체 역할
  1. 변수/상수 등으로 저장 / 전달 가능
  2. 전달인자로 보낼 수 있고
  3. 함수의 반환값이 될 수 있음 (return 클로저)
- 보통 Closure라고 하면?
  - Unnamed Closure (익명함수) 지칭
    > 다만, Named closure도 존재한다는 것

<br>

```
💡 표현식 : 클로저 head + body 로 이뤄져있음
  { (매개변수) -> 리턴타입 in
        실행구문
  }
```

<br>


#### 16.1.1 변수/상수에 저장/전달 가능
- closure은, 보통 익명함수를 지칭   

<br>

```swift
let hello = { () -> () in
    print("hello")
}

hello() // 함수 호출과 동일 (= 클로저(함수)가 대입됐으니깐!)
```



<br>


#### 16.1.2 파라미터, 리턴타입 있는 클로저 선언 
- ***name 파라미터 인식 주의!***
  - 전달인자 lable이자 파라미터 name 아님!!(X)
    > 함수처럼 파라미터의 name이 단독으로 쓰였으니, 그렇게 생각할 수 있겠으나! 
  - 클로저에는 전달인자 lable 사용 **X**
  - 그래서, 클로저 호출시 일반함수 호출하는것 처럼 하면
    > Error!
      - ex1) hello2(name: "Hakyung") (X: name은 전달인자 lable이 아니기 때문!)
      - ex2) hello2("Hakyung") (O) 

<br>

```swift
let hello2 = { (name: String) -> String in
    return "Hello, \(name)!"
}

hello2(name: "Hakyung") // X (name은 전달인자 lable이 아니기 때문!)
hello2("Haykung") // O
```




<br>


#### 16.2 함수의 파라미터 타입으로 클로저 전달하기 
> 파라미터와 리턴타입이 없는 클로저

<br>

```swift
func doSomething(closure: () -> ()) { // no파라미터, no리턴타입이니깐
    closure() // doSomething 함수 호출시, 전달받은 closure가 실행되게 
}

// 함수 호출 
doSomething(closure: { () -> () in // 함수 파라미터로 no파라미터, no리턴타입 클로저 전달 
    print("Hello doSomething")
})
```



<br>


#### 16.3 반환값이 될수도 있다 (return 클로저)
> 파라미터와 리턴타입이 없는 클로저를 return type으로 반환하는 함수 

<br>

```swift
func doSomeThing2() -> () -> () {
    return { () -> () in // no파라미터, no리턴타입이 return type이므로! 
        print("Hello doSomeThing2")
    }
}

// 함수 호출
doSomeThing2()() // Hello doSomeThing2
```


<br>


#### 16.4 읽기 쉬운 클로저로 바꾸기 == 후행 클로저 가능 
: 클로저가 길어지거나, 가독성이 떨어질 때! 
- no파라미터, no리턴타입 클로저의 경우
  > () -> () in 생략 가능
- 후행 클로저?
  - 매개변수로 클로저 여러개 전달시
    > 맨 마지막 클로저만 후행 클로저 가능!

<br>

```swift
// 1. () -> () in 생략 가능 
doSomething() {
    print("doSomething 후행클로저 실행")
}

// 2. 단 하나의 no파라미터, no리턴타입 클로저를 매개변수로 전달시, 소괄호도 생략 가능!
doSomething {
    print("doSomething 소괄호도 생략")
}

// 3. 다중 후행 클로저
// : 매개변수에 다중 클로저가 있는 경우, 첫번째 매개변수 레이블 생략! 
func doMultiClosure(success: () -> (), fail: () -> (), test3: () -> ()) {
}

doMultiClosure { // 첫번째 클로저 success 매개변수 레이블 생략!
    print("success")
} fail: {
    print("fail")
} test3: {
    print("test3")
}
```


<br>


#### 16.5 closure 간소화 하기
: 문법 최적화하여, 간소화하기


<br>

- 16.5.1 간소화 X version

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
    // 매개변수로 전달받은 closure를 실행하는데, 
    // 이때, 매개변수로 1,2,3을 넘겨주고 있다. 
}
```


<br>

- 16.5.2 경량문법 - makeItShort 클로저 호출 

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

makeItShort(closure: { (a, b, c) in // 1. 파라미터 data type 생략 
    retun a + b + c // 2. Type 유추를 통해, return 타입 생략 가능   
})
```


<br>

- 16.5.3 약식 - makeItShort 클로저 호출 (파라미터, 리턴 형식 생략)

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

makeItShort(closure: {
    return $0 + $1 + $2
    // 매개변수 이름 생략 -> 매개변수를 약식 인수 $0, 1, 2 이름으로 대체!
    // >> () -> () in 키워드 삭제 가능!
})
```



<br>

- 16.5.4 약식2 - makeItShort 클로저 호출 (리턴 마저도 생략)
  > 단, 단일 return 문일 때!

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

// O
makeItShort(closure: {
    $0 + $1 + $2
})

// X : Error!
makeItShort(closure: {
    print("test")
    $0 + $1 + $2
})
```



<br>

- 16.5.5 후행 클로저 - makeItShort 클로저 호출 (closure: 생략)

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

makeItShort() {
    $0 + $1 + $2
}
```


<br>

- 16.5.6 후행 클로저2 - makeItShort 클로저 호출 (closure:, () 마저도 생략)

```swift
func makeItShort(closure: (Int, Int, Int) -> Int) {
    closure(1, 2, 3)
}

makeItShort {
    $0 + $1 + $2
}
```

<br>

#### 16.6 Class instance 로 클로저 할당시; 
- 클로저와, 인스턴스 사이에 강한 순환참조가 생겨서
  > 메모리 leak 발생 가능..


<br>


----
<br>






### 17. Map, Filter, Reduce ([code](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Map%2C%20Filter%2C%20Reduce.xcplaygroundpage/Contents.swift))
- Swift 에서 제공하는 고차함수 : Map, Filter, Reduce
  > 모두 collection type
- 고차함수란?
  > 다른 함수를 전달인자로 받거나, 함수 실행의 결과를 함수로 변환하는 함수



<br>

#### 17.1 map
- map 함수는, 컨테이너 내부에 기존 테이터를 변형하여 -> 새로운 컨테이너를 생성한다. 

```swift
let numbers = [0, 1, 2, 3]
let mapArray = numbers.map { (number) -> Int in 
    return number * 2
}

print("numbers: \(numbers)") // numbers: [0, 1, 2, 3]
print("mapArray: \(mapArray)") // mapArray: [0, 2, 4, 6]
```


<br>


#### 17.2 filter
- 컨테이너 내부의 값을 걸러서, 새로운 컨테이너로 추출 

```swift
let intArray = [10, 5, 20, 13, 4]
let filterArray = intArray.filter { $0 > 5 }

print("intArray: \(intArray)") // [10, 5, 20, 13, 4]
print("filter: \(filterArray)") // [10, 20, 13]
```

<br>

#### 17.3 reduce
- 컨테이너의 요소를 -> 하나로 통합시켜줌  

```swift
let someArray = [1, 2, 3, 4, 5]
let reduceResult = someArray.reduce(0) { // 0은 초기값, 설정한 초기값부터 + someArray 배열의 값을 다 더하기
    (result: Int, element: Int) -> Int in // result: 총 더한 값, element : 현재 요소
    print("\(result) + \(element)")
    return result + element
}

print("reduceResult: \(reduceResult)")
// 0 + 1
// 1 + 2
// 3 + 3 
// 6 + 4
// 10 + 5
// reduceResult: 15
```


<br>



----
<br>






### 18. Typecasting 
- as? 를 이용해서 typecasting 하는 것을 도와줌
- as? 는 optional 타입임

```swift
class Animal {
}

class Cat: Animal {
}

class Dog: Animal {
    func bark() {
        print("wal wal!")
    }
}

let pets: [Animal] = [Cat(), Dog(), Cat(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.bark()
    }
}
// wal wal!
// wal wal!
```
