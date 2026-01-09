//
//  main.swift
//  juhee
//
//  Created by 김주희 on 1/6/26.
//

import Foundation

//과제 1 풀이

let sum = { (a: Int, b: Int) -> String in
    return "두 수의 합은 \(a + b) 입니다."
    // 클로저 타입 명시하는법?
}

print(sum(10, 20)) // 두 수의 합은 30 입니다. 출력

func calculate(a: Int, b: Int, closure: (Int, Int) -> String) -> Void {
    print(closure(a, b))
}


// 과제 2 풀이

let numbers = [1, 2, 3, 4, 5]

var result = [String]()

result = numbers.map { String($0) }
print(result)


let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


// 체이닝 방식으로 수정
let result2 = numbers2.filter { $0 % 2 == 0} .map { String($0) }
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
        if count % 2 != 0 {
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
        if count % 2 != 0 {
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
        if count % 2 != 0 {
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
    var name: String { get set }

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
