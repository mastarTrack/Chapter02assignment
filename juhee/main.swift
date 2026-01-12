//
//  main.swift
//  juhee
//
//  Created by 김주희 on 1/6/26.
//

import Foundation

// MARK: - 과제 1 풀이

// 1-1
// sum의 타입도 명시하고 클로저 내부 구현도 함
let sum: (Int, Int) -> String = {(a: Int, b: Int) -> String
    in "두 수의 합은 \(a + b) 입니다." // return 생략
}

print(sum(10, 20)) // 두 수의 합은 30 입니다. 출력

// 1-2
func calculate(a: Int, b: Int, closure: (Int, Int) -> String) {
    print(closure(a, b))
}
// 함수의 출력값이 없을때 -> Void 생략 가능




// MARK: - 과제 2 풀이

// 2-1
let numbers = [1, 2, 3, 4, 5]

var result = [String]()

result = numbers.map { String($0) }

print(result) // ["1", "2", "3", "4", "5"] 출력



// 2-2
let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// 체이닝 방식으로 수정
let result2 = numbers2
    .filter { $0 % 2 == 0}
    .map { String($0) } // 줄바꿈 (수정), result2 배열 let으로 선언 (수정)

print(result2) // ["2", "4", "6", "8", "10"] 출력



// 2-3
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

print(result4) // ["1", "2", "3", "4", "5"] 출력




// MARK: - 과제3 풀이

// 3-1
// 3-1은 .enumarated()를 이용한 풀이로 수정
func a(_ array: [Int]) -> [Int] {
    array.enumerated() // [(0, 1), (1, 2), (2, 3), (3, 4), (4, 5)]
        .filter { (idx, _) in // 튜플에서 인덱스만 보고 2의 배수인것만 남긴다
            idx.isMultiple(of: 2) // [(0, 1), (2, 3), (4, 5)]만 필터링 되어서 남음
        }
        .map { (_, value) in // 튜플에서 value값만 뽑아서 배열로 만듬
            value
        }
        // [1, 3, 5]
}

print(a([1, 2, 3, 4, 5])) // [1, 3, 5] 출력



// 3-2
// 3-1번 풀이와 매개변수의 타입만 다를뿐 풀이 방식은 같음
func b (array: [String]) -> [String] {
    array.enumerated() // [(0, "가"), (1, "나"), (2, "다"), (3, "라"), (4, "마")]
        .filter { (idx, _) in // 튜플에서 인덱스만 보고 2의 배수인것만 남긴다
            idx.isMultiple(of: 2) // [(0, "가"), (2, "다"), (4, "마")]만 필터링 되어서 남음
        }
        .map { (_, value) in // 튜플에서 value값만 뽑아서 배열로 만듬
            value
        }
}

print(b(array: ["가", "나", "다", "라", "마"])) // ["가", "다", "마"] 출력



// 3-3
// 제네릭
func c<T>(array: [T]) ->[T] {

    var returnArray = [T]()

    for i in 0..<array.count {
        if i % 2 == 0 {
            returnArray.append(array[i])
        }
    }
    return returnArray
}

print(c(array: [1, 2, 3, 4, 5])) //  [1, 3, 5] 출력
print(c(array: ["가", "나", "다", "라", "마"])) // ["가", "다", "마"] 출력



// 3-4
// 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경
func d<T: Numeric>(array: [T]) ->[T] {

    var returnArray = [T]()

    for i in 0..<array.count {
        if i % 2 == 0 {
            returnArray.append(array[i])
        }
    }
    return returnArray
}

print(d(array: [1, 2, 3, 4, 5])) // [1, 3, 5] 출력
// print(d(array: ["가", "나", "다", "라", "마"])) 오류 발생함, 문자열은 Numeric 프로토콜을 준수하는 타입이 아님




// MARK: - 문제 4 풀이

// 4-1
protocol Introducible {
    var name: String { get }

    func introduce() -> String
}


class Robot: Introducible {
    var name: String {
        // 프로퍼티 옵져버
        willSet {
            if newValue != name {
                print("name 변경 알림")
                print("변경 이전 값: \(name)") // self.name과 name은 같은 값임
                print("변경 이후 값: \(newValue)")
            } // willset은 자동으로 값이 대입되므로 newValue = self.name 필요없음 (수정)
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
robot.name = "로봇" // willSet 출력문 실행 X
robot.name = "로봇 이름 변경" // name 변경 알림  변경 이전 값: 로봇  변경 이후 값: 로봇 이름 변경 출력


// 4-2
var cat = Cat(name: "냥이")
var dog = Dog(name: "멈무")

let arrayIntroducible: [Introducible] = [robot, cat, dog] // 선언과 동시에 초기화 하도록 리펙토링

arrayIntroducible.forEach {
    // i.batteryCharge() error: Value of type 'any Introducible' has no member 'batteryCharge'
    if let robot = $0 as? Robot { // 비효율적인 반복을 줄이고 가독성 향상을 위해 else if문으로 수정
        print(robot.batteryCharge())
    } else if let cat = $0 as? Cat {
        print(cat.grooming())
    } else if let dog = $0 as? Dog {
        print(dog.bark())
    }
}




// MARK: - 문제 5 풀이

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
    
    guard !address.isEmpty else { // if else 중첩문에서 guard로 리펙토링
        throw DeliveryError.invalidAddress
    }
    switch status {
    case .notStated:
        throw DeliveryError.notStarted
    case .error:
        throw DeliveryError.systemError(reason: "알 수 없음")
    case .inTransit(let daysRemaining):
        return("배송까지 \(daysRemaining)일 남았습니다.")
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



// MARK: - 도전 문제 풀이



// 1-2 문제

// 제네릭 구조체 정의
struct SortableBox<T> {
    var items: [T]
}

// 타입 T가 Comparable을 준수할 때에만 sortItems() 메서드 확장
extension SortableBox where T: Comparable {
    mutating func sortItems() { // mutating 키워드 필수
        items.sort()
    }
}

// Comparable 따르는 타입
var intBox = SortableBox(items: [4, 10, 3]) // 변수이름의 의미가 명확히 드러나게 수정 (intBox)
intBox.sortItems()
print(intBox.items) // [3, 4, 10] 정상 출력

// T가 Comparable이 아닌 구조체 사용
struct BoxTypeB {
    var i: Int
}

var nonComparableBox = SortableBox(items: [BoxTypeB(i: 7), BoxTypeB(i: 27)]) // 변수 이름 수정 (가독성)

// nonComparableBox.sortItems()
// 컴파일 에러: Referencing instance method 'sortItems()' on 'SortableBox' requires that 'BoxTypeB' conform to 'Comparable'



// 1-3 문제

//protocol Introducible {
//    var name: String { get }
//    func introduce() -> String
//}
//
//extension Introducible {
//    func introduce() -> String { // 기본 동작 제공
//        "안녕하세요. 제 이름은 \(name) 입니다."
//    }
//}
//
//struct Robot: Introducible {
//    let name: String
//    
//    func introduce() -> String {
//        "저는 동물이 아닌 로봇 \(name)입니다."
//    }
//}
//
//struct Cat: Introducible {
//    let name: String
//}
//
//struct Dog: Introducible {
//    let name: String
//}
//
//let robot = Robot(name: "쓱싹쓱싹 로봇 청소기")
//let cat = Cat(name: "아기고냥이")
//let dog = Dog(name: "모찌")
//
//print(robot.introduce()) // 저는 동물이 아닌 로봇 쓱싹쓱싹 로봇 청소기입니다. 출력
//print(cat.introduce()) // 안녕하세요. 제 이름은 아기고냥이 입니다.
//print(dog.introduce()) // 안녕하세요. 제 이름은 모찌 입니다.
