import Foundation

/*
 Optional Chaining
 : optional에 속해있는 nil 일지도 모르는 property, method, subscription 등을 가져오거나 / 호출할때 사용할 수 있는 일련의 과정
 
 - ! 또는 ? 로 property / method 등을 접근
 - property / method 등에 값이 있다면, 해당 값을,
   값이 없다면 nil 을 반환!
 */

struct Developer {
    let name: String
}

struct Company {
    let name: String
    var developer: Developer?
}

var developer = Developer(name: "Miel")
var company = Company(name: "Apple", developer: developer)
print(company.developer) // optional 에 감싸진, instance 가 출력됨
print(company.developer?.name)
// company.developer는, optional type이기 때문에, optional을 벗겨내고 name에 접근해!
// 이전방식으로 optional binding하여, 값 접근 가능하지만,
//      >> optional chaining 사용하여, optional property에 접근 가능!
// ? 사용하여 optional chaining시;
//      >> 접근한 property의 값은 항상 optional에 감싸져 있음
//      >> 값이 nil이 될 수도 있어서, optional로 감싸져있음
//          -> 따라서, optional벗겨내고싶으면, optional binding사용하면됨!

print(company.developer!.name)
// ! 사용하여 optional chaining시;
//      >> optionl property를 강제 unmapping하여 접근하여 -> optional에 감싸져 있지 X


/*
 정리
 >> optional binding 없이, optional chaining사용시; 값에 쉽게 접근 가능!
 */
