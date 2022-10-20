import Foundation
import Combine
import UIKit

/// @Published (Publisher)
/// @Published로 선언된 프로퍼티를 publisher로 만들어줌
/// Class 에 한해서 사용됨  !!!
/// $ 를 이용해서, publisher에 접근할 수 있음

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 25
}

final class Label {
    var label: String = ""
}

// Q. SomeViewModel의 name데이터를 Label class의 label에 할당 시키기!
let label = Label()
let vm = SomeViewModel()

print("text: \(label.label)")

vm.name = "test name"
print("text: \(label.label), name: \(vm.name)")

// publisher에서 생긴 data를 label의 label property에 할당한다.
vm.$name.assign(to: \.label, on: label)
print("text: \(label.label)")

vm.name = "Jason"
print("text: \(label.label)")

vm.name = "Sohhhn"
print("text: \(label.label)")

/*
 name property publisher로 만들어서,
 이 안에 들어있는 Jack을 subscriber로 assign-할당 하는 것
 */
