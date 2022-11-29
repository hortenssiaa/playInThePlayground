import Foundation

/*
 고차함수란?
 : 다른 함수를 전달인자로 받거나, 함수 실행의 결과를 함수로 반환하는 함수
 
 Swift 에서 제공하는 고차함수
 : map, filter, reduce
 >> 모두 collection type
 */


// 1. map
// : map 함수는, 컨테이너 내부에 기존 데이터를 변형하여 -> 새로운 컨테이너를 생성한다
let numbers = [0, 1, 2, 3]
let mapArray = numbers.map { (number) -> Int in
    return number * 2
}
print("numbers: \(numbers)")
print("mapArray: \(mapArray)")


// 2. filter
// : 컨테이너 내부의 값을 걸러서, 새로운 컨테이너로 추출
let intArray = [10, 5, 20, 13, 4]
let filterArray = intArray.filter { $0 > 5 }
print("intArray: \(intArray)")
print("filter: \(filterArray)")


// 3. reduce
// : 컨테이너의 요소를 -> 하나로 통합시켜줌
let someArray = [1, 2, 3, 4, 5]
let reduceResult = someArray.reduce(0) { //0은 초기값, someArray 배열의 값을 다 더하기
    (result: Int, element: Int) -> Int in // resut : 총 더한 값, element : 현재 요소
    print("\(result) + \(element)")
    return result + element
}
print("reduceResult: \(reduceResult)")
