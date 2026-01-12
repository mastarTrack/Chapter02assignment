//
//  main.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/6/26.
//

import Foundation
print("--------필수문제 1-------------------")
// 필수 문제 1--------------------------------------------------------------------------

//두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
// {(num1: Int, num2: Int) -> String in return "두 수의 합은 \(num1 + num2) 입니다"}


// 이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요
let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다" }


//sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
print(sum(1,3))


//위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
func calculate(num1: Int, num2: Int, _ sum: (Int, Int) -> String) {
    print(sum(num1, num2))
}

calculate(num1: 5, num2: 25, sum)




print("--------필수문제 2-------------------")
// 필수 문제 2------------------------------------------------------------------------

//아래 for-in 문을 map 을 사용하는 코드로 변환해주세요.
let numbers = [1, 2, 3, 4, 5]
var result = [String]()

result = numbers.map { "\($0)" }
print(result)



//주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
let oneToTen = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let resultArr = oneToTen.filter { $0 % 2 == 0 }.map { "\($0)" }

print(resultArr)



//이제 고차함수를 직접 만들어 봅니다.
func myMap(_ IntArr: [Int], _ change: (Int) -> String) -> [String] {
    var result: [String] = []
    for num in IntArr {
        result.append(change(num))
    }
    return result
}

let newArr = myMap([1, 2, 3, 4, 5]) { String($0) }
print(newArr)



print("--------필수문제 3-------------------")
// 필수 문제 3---------------------------------------------------------------------------
// Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a 를 작성해주세요.
func a(_ array: [Int]) -> [Int] {
    var result = [Int]()
    for i in 0..<array.count {
        if i % 2 != 0 {
            result.append(array[i])
        }
    }
    return result
}

let IntArray = a([1, 2, 3, 4, 5])
print(IntArray)


//String 배열의 짝수번째 요소를 제거해서 반환하는 함수 b 를 작성해주세요.
func b(_ array: [String]) -> [String] {
    var result = [String]()
    for i in 0..<array.count {
        if i % 2 != 0 {
            result.append(array[i])
        }
    }
    return result
}
let StringArray = b(["가", "나", "다", "라", "마"])
print(StringArray)


//위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 c 로 작성해주세요.
func c<T>(_ array: [T]) -> [T] {
    var result = [T]()
    for i in 0..<array.count {
        if i % 2 != 0 {
            result.append(array[i])
        }
    }
    return result
}
let StringArray2 = c(["가", "나", "다", "라", "마"])
let IntArray2 = c([1, 2, 3, 4, 5])
print(StringArray2, IntArray2)


//함수 c 를 기반으로 수정하여 함수 d 를 작성해주세요.
//파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.
func d<T: Numeric>(_ array: [T]) -> [T] {
    var result = [T]()
    for i in 0..<array.count {
        if i % 2 != 0 {
            result.append(array[i])
        }
    }
    return result
}

let IntArray3 = d([1, 2, 3, 4, 5])
print(IntArray3)


print("--------필수문제 4-------------------")
// 필수 문제 4---------------------------------------------------------------------------
// 타입 정의는 mission4에 있습니다.
//[Introducible] 타입 배열을 정의하고, Robot, Cat, Dog 인스턴스 1개씩을 append 해주세요.
var introducibleArray = [Introducible]()
introducibleArray.append(Cat())
introducibleArray.append(Dog())
introducibleArray.append(Robot())

//배열을 순회하며 각 타입 고유의 메서드들을 호출하는 코드를 작성해주세요.
for i in introducibleArray {
    switch i {
    case is Cat:
        let cat = i as! Cat
        print(cat.meow())
        print(cat.introduce())
    case is Dog:
        let dog = i as! Dog
        print(dog.bark())
        print(dog.introduce())
    case is Robot:
        let robot = i as! Robot
        print(robot.charge())
        print(robot.introduce())
    default:
        print("해당없음")
    }
}



print("--------필수문제 5-------------------")
// 필수 문제 5---------------------------------------------------------------------------
//위 함수를 do-catch 로 호출하고, 각 에러 상황에 따라 사용자에게 다른 메시지를 출력하세요.

func test(_ address: String, _ status: DeliveryStatus) {
    do {
        let message = try predictDeliveryDay(for: address, status: status)
        print(message)
    } catch DeliveryError.invalidAddress {
        print("잘못된 주소입니다.")
    } catch DeliveryError.notStarted {
        print("배송준비중입니다.")
    } catch DeliveryError.systemError(let reason) {
        print("\(reason)가 발생했습니다.")
    } catch {
        print("알 수 없는 오류 발생했습니다.")
    }
}

test("서울", .inTransit(daysRemaining: 2))
test("", .inTransit(daysRemaining: 2))
test("서울", .notStarted)
test("서울", .error)

print("--------도전문제 1-------------------")
let electricCar = ElectricCar(brand: "전기차브랜드", model: "전기차모델", year: "전기차 연식")
electricCar.drive()
electricCar.stop()
//electricCar.engine = HydrogenEngine() 이런식으로 바꿀수 없게 설계


let hybridCar = HybridCar(brand: "하이브리드", model: "모델", year: "연식")
hybridCar.switchEngine(to: ElectricEngine())


print("--------도전문제 4-------------------")
makeMemoryLeak()
