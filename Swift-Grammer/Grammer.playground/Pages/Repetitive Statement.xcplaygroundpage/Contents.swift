import UIKit

/* 1
 for 루프상수 in 순회대상 {
    // 실행할 구문..
 }
 */

for i in 1...4 {
    print("i : \(i)")
}

let array = [10, 20, 30, 40, 50,]
for j in array { // Array, Dictionary, Set, String도 순회대상으로 사용 가능!
    print("j : \(j)")
}


/* 2
 while 조건식 {
    // 실행할 구문
 }
 */

var number = 5
while number < 10 {
    number += 1
}
number


/* 3
 repeat-while (== do-while)
 repeat {
    // 실행할 구문
 } while 조건식
 */

var x = 6

repeat {
    x += 2
} while x < 5

print("x: \(x)")
