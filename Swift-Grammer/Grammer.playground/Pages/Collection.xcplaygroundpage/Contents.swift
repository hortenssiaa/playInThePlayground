import UIKit

// 1. Array : 중복 O, 순서 O
// (1)
//var numbers: Array<Int> = Array<Int>()
var numbers: [Int] = [] // 축약형
numbers.append(1)
numbers.append(2)
numbers.append(3)

numbers.insert(4, at: 2)
numbers

numbers.remove(at: 0)
numbers

numbers.capacity
numbers.count
let arrDescription = numbers.description // String
print(arrDescription)
numbers.endIndex
numbers.startIndex
numbers.isEmpty

// (2)
//var string = [String]()
var strings: [String] = [] // 축약형
strings.append("hi")

// (3)
let ages = [3, 20, 60]
let colors = ["green", "red", "yellow"]

let color = colors[1] // "red"



// 2. Dictionary : [Key : Value]
// (1)
//var dictionary: Dictionary<String, Int> = Dictionary<String, Int>()
//var dictionary: [String: Int] = [:]
//var emptyDic: [String: Any] = [:]
var dictionary: [String: Int] = ["hakyung":1] // 초기값 선언
dictionary["John"] = 3
dictionary["Ruth"] = 5
dictionary

dictionary["John"] = 7
dictionary

dictionary.removeValue(forKey: "john") // nil
dictionary

dictionary.removeValue(forKey: "John")
dictionary


// (2)
let languageCode = [
    "한국" : "ko",
    "미국" : "en",
    "일본" : "jp",
]

let code =  languageCode["한국"] // "ko"



// 3. Set : 중복 X, 순서 X
// 축약형 선언 불가능!
var set: Set = Set<Int>()
set.insert(10)
set.insert(20)
set.insert(30)
set.insert(30)
set.insert(30)
set

set.remove(20)
set
