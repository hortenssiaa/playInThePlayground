# 🥗  Swift Grammer

### 1. [Basic Data Type](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Basic%20Data%20Type.xcplaygroundpage/Contents.swift)
    • Int, UInt
    • Float, Double
    • Bool
    • Character, String
    • Any
----
<br>

### 2. [Collection](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Collection.xcplaygroundpage/Contents.swift)
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



### 3. [Function](https://github.com/hortenssiaa/playInThePlayground/blob/master/Swift-Grammer/Grammer.playground/Pages/Function.xcplaygroundpage/Contents.swift)
: Swift는 함수형 프로그래밍 패러다임을 포함한, 다중 패러다임을 포함한 언어
- 함수는? 1급 객체
- 함수를? 변수(var) / 상수(let) 등에 할당 가능
- 함수를? 매개변수를 통해 전달 가능
<br>

#### 3.1 **매개변수 기본값 세팅**
```swift
func greetings(friend: String, me: String = "Hakyung" {
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

#### 3.3 **전달인자 Lable 사용하고싶지 않다면? -> wild card _ 사용**
```swift
func sendMessage(_ name: String) -> String {
    return "Hello, \(name)"
}

sendMessage("손하경")
// Hello, 손하경
```
<br>

#### 3.4 **전달인자 Lable 사용하고싶지 않다면? -> wild card _ 사용**
```swift
func sendMessage(_ name: String) -> String {
    return "Hello, \(name)"
}

sendMessage("손하경")
// Hello, 손하경
```
<br>

#### 3.5 **가변 매개변수**
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

