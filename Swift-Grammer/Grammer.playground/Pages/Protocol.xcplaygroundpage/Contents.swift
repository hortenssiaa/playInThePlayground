import Foundation

/*
 Protocol?
 : 특정 역할을 하기 위해 요구사항의 청사진 (계획/구상)
 - Structure, Class, Enum 에서 protocol채택 가능
    >> protocol의 요구사항을 실제 구현시; protocol의 요구사항을 모두 충족하면, 채택한 protocol을 준수했다! 라고 말할 수 있다.
 - 특정역할을 위한 요구사항 : method, property, init 등
 */

protocol SomeProtocol {
    // property : property 이름, type 만 지정
    var name: Int { get set } // SomeProtocol protocol을 채택한 타입에게, name property를 읽기&쓰기로 실제 구현을 준수해라!
    var age: Int { get } // 읽기전용
}

protocol SomeProtocol2 {
}

protocol AnotherProtocol {
    // protocol에서, type property을 요구하려면: static 사용
    static var someTypeProperty: Int { get set }
}

struct SomeStructure: SomeProtocol, SomeProtocol2 {
    var name: Int
    var age: Int
}



// ** Class: 상속받을 class를 제일 먼저 작성! -> protocol 순서
// ** class에서, 채택한 property에 initializer(init) 요구사항이 있을시; required 키워드 반드시 사용!
//      >> final 이 있어, 상속받지 못하는 class인 경우는, required 생략 가능!
//      >> struct (구조체) 에서는, required 필요 X
/*
    class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {

     }
*/

protocol FullyNames {
    var fullName: String { get set }
    
    // * method 요구사항
    // - instance method, type method 모두 가능
    // - 매개변수는 지정 불가
    func printFullName()
    
    // * initializer(init) 요구사항
    // 1. init()
    // 2. init(매개변수)
    // >> 모두 가능
    init(fullName: String)
}

protocol InitTestProtocol {
    init()
}

// class에서, protocol init 요구사항 실현시, required 반드시 필요!
// >> final class 인경우는, 상속받지 못하므로 required 필요 X
class InitTestClass: InitTestProtocol {
    required init() {
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
