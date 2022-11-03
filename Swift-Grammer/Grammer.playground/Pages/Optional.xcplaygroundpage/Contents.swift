import UIKit

/*
 Optional
 : 값이 있을수도~ 없을수도~ 있다.
 - 초기값 nil
 - 일반 프로그래밍; 값이 null에 접근시, runtime error -> 프로그램종료 O
 - Swift : 안정성이 장점! optional 사용시, nil에 접근해도 -> 프로그램종료 X
 */

var name: String?

var optionalName: String? = "Hakyung"
print(optionalName) // Optional("Hakyung")

//var requiredName: String = optionalName
// error : Value of optional type 'String?' must be unwrapped to a value of type 'String'
// >> optionalName은 옵셔널 타입으로 포장지가 쌓여있기 때문에,
// >> 일반 변수에 대입/연산 불가!
// >> Optional("Hakyung")
