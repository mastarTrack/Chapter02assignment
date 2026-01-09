//
//  main.swift
//  juhee
//
//  Created by 김주희 on 1/6/26.
//

import Foundation

//과제 1 풀이

// sum의 타입도 명시하고 클로저 내부 구현도 함
let sum: (Int, Int) -> String = {(a: Int, b: Int) -> String
    in return "두 수의 합은 \(a + b) 입니다."
}

print(sum(10, 20)) // 두 수의 합은 30 입니다. 출력

func calculate(a: Int, b: Int, closure: (Int, Int) -> String) {
    print(closure(a, b))
}
// 함수의 출력값이 없을때 -> Void 생략 가능

// 과제 2 풀이

let numbers = [1, 2, 3, 4, 5]

var result = [String]()

result = numbers.map { String($0) }
print(result)


let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


// 체이닝 방식으로 수정
let result2 = numbers2
    .filter { $0 % 2 == 0}
    .map { String($0) } // 줄바꿈 (수정), result2 배열 let으로 선언 (수정)

print(result2)

func myMap (a: [Int], operation: (Int) -> String) -> [String] {
    var result = [String]()
    for i in a {
        result.append(operation(i)) // 파라미터로 받은 클로저 이용해서 변환
    }
    return result
}

let result4 = myMap(a: [1, 2, 3, 4, 5]) {
    String($0)
}

print(result4)




// 과제3 풀이

// 3-1
func a (array: [Int]) -> [Int] {

    var returnArray = [Int]()
    var count: Int = 0

    for i in array {
        count += 1
        if count % 2 == 0 {
            returnArray.append(i)
        }
    }
    return returnArray
}

print(a(array: [1, 2, 3, 4, 5]))



// 3-2
func b (array: [String]) -> [String] {

    var returnArray = [String]()
    var count: Int = 0

    for i in array {
        count += 1
        if count % 2 == 0 {
            returnArray.append(i)
        }
    }
    return returnArray
}

print(b(array: ["가", "나", "다", "라", "마"]))


// 3-3

// 제네릭
func c<T>(array: [T]) ->[T] {

    var returnArray = [T]()
    var count: Int = 0

    for i in array {
        count += 1
        if count % 2 == 0 {
            returnArray.append(i)
        }
    }
    return returnArray
}

print(c(array: [1, 2, 3, 4, 5]))
print(c(array: ["가", "나", "다", "라", "마"]))



// 3-4
// 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경
func d<T: Numeric>(array: [T]) ->[T] {

    var returnArray = [T]()
    var count: Int = 0

    for i in array {
        count += 1
        if count % 2 != 0 {
            returnArray.append(i)
        }
    }
    return returnArray
}

print(d(array: [1, 2, 3, 4, 5]))
// print(d(array: ["가", "나", "다", "라", "마"])) 오류 발생




// 문제 4 풀이

protocol Introducible {
    var name: String { get } // 외부에서 이름을 변경해야한다는 조건은 없으므로 불필요한 제약조건이 생기는 get set에서 get 제약 조건으로 수정

    func introduce() -> String
}


class Robot: Introducible {
    var name: String {
        // 프로퍼티 옵져버 쓰기
        willSet {
            if newValue != self.name {
                print("변경 이전 값: \(self.name)")
                print("변경 이후 값: \(newValue)")
                self.name = newValue
            }
        }
    }
    
    func introduce() -> String {
        return "안녕하세요, 저는 \(name) 입니다."
    }

    func batteryCharge() -> String {
        return "전원을 충전합니다."
    }
    init(name: String) {
        self.name = name
    }
}


    class Cat: Introducible {
        var name: String

        func introduce() -> String {
            return "안녕하세요, 저는 \(name) 입니다."
        }

        func grooming() -> String {
            return "야옹"
        }

        init(name: String) {
            self.name = name
        }
    }

    class Dog: Introducible {
        var name: String

        func introduce() -> String {
            return "안녕하세요, 저는 \(name) 입니다."
        }

        func bark() -> String {
            return "멍멍멍"
        }

        init(name: String) {
            self.name = name
        }
    }

    var robot = Robot(name: "로봇")
    robot.name = "로봇 이름 변경"

    var cat = Cat(name: "냥이")

    var dog = Dog(name: "멈무")



var arrayIntroducible = [Introducible]()

arrayIntroducible.append(robot)
arrayIntroducible.append(cat)
arrayIntroducible.append(dog)

for i in arrayIntroducible {
    // i.batteryCharge() error: Value of type 'any Introducible' has no member 'batteryCharge'
    if let robot = i as? Robot {
        print(robot.batteryCharge())
    }
    if let cat = i as? Cat {
        print(cat.grooming())
    }
    if let dog = i as? Dog {
        print(dog.bark())
    }
}


// 문제 5 풀이

enum DeliveryStatus{
    case notStated
    case inTransit(daysRemaining: Int)
    case error
}

enum DeliveryError: Error {
    case invalidAddress
    case notStarted
    case systemError(reason: String)
}

// throwing function
func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
    
    if address.isEmpty {
        throw DeliveryError.invalidAddress
    } else {
        switch status {
        case .notStated:
            throw DeliveryError.notStarted
        case .error:
            throw DeliveryError.systemError(reason: "알 수 없음")
        case .inTransit(let daysRemaining):
            return("배송까지 \(daysRemaining)일 남았습니다.")
        }
    }
}

do {
    let message = try predictDeliveryDay(for: "제주특별시", status: .inTransit(daysRemaining: 3))
    print(message)
} catch DeliveryError.invalidAddress {
    print("주소가 잘못입력되었습니다. 주소를 확인해주세요.")
} catch DeliveryError.notStarted {
    print("배송이 아직 시작되지 않았습니다.")
} catch DeliveryError.systemError(let reason) {
    print("시스템 에러가 발생하였습니다: \(reason)")
}

