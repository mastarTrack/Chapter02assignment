//
//  mission4.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/7/26.
//

// 필수 문제 4---------------------------------------------------------------------------
//Introducible 프로토콜을 정의하세요.
protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}


//Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
//Introducible 프로토콜 에 정의되지 않은 각 타입 고유의 메서드들도 하나씩 추가 정의해주세요.
class Cat: Introducible {
    var name: String = ""
    
    func introduce() -> String {
        return "안녕, 난 🐱\(name)라고 해."
    }
    
    func meow() -> String {
        return "🐈야옹"
    }
}

class Dog: Introducible {
    var name: String = ""
    
    func introduce() -> String {
        return "안녕하세요, 저는 🐶\(name)입니다."
    }
    
    func bark() -> String {
        return "🐾월월"
    }
}

//Robot 타입의 경우, name 값이 변경될 때마다 변경 이전값과 이후 값을 출력하도록 구현해주세요.
//만약 변경 이전값과 이후값이 같다면 출력하지 않아야합니다.
class Robot: Introducible {
    var name: String = "" {
        didSet(oldName) {
            guard oldName != name else { return }
            print("name 변경 알림 \n변경 이전 값: \(oldName) \n변경 이후 값: \(name)")
        }
    }
    
    func introduce() -> String {
        return "안녕하세요, 저는 🤖\(name)입니다."
    }
    
    func charge() -> String {
        return "🔋충전 중"
    }
}
