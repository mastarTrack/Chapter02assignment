//
//  main.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

//MARK: 필수 문제

// 1.
// - sum 호출 코드
print(Required1().sum(3, 5))

// - calculate 호출 코드
Required1().calculate(3, 5, Required1().sum)


// 2.
// - 고차함수 체이닝 호출 코드
print(Required2().mapChain([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))

// - myMap 호출 코드
print(Required2().myMap([1, 2, 3]) { String($0) })


// 3.
// - 함수 a 호출 코드
print(Required3().a([1, 2, 3, 4, 5]))

// - 함수 b 호출 코드
print(Required3().b(["가", "나", "다", "라", "마"]))

// - 함수 c 호출 코드
print(Required3().c([1, 2, 3, 4, 5]))
print(Required3().c(["가", "나", "다", "라", "마"]))


// - 함수 d 호출 코드
// print(answer.required3.d(["가"]))  // 오류
print(Required3().d([1, 2, 3, 4, 5]))


// 4.
// - Robot.name 프로퍼티 옵저버 확인
var robot = Robot(name: "로봇")
robot.name = "로보트"
robot.name = "로보트" // 문자열 출력 X

// - [Introducible] 타입 배열 정의, 배열을 순회하며 고유 메서드 호출
var introducibleArr: [Introducible] = []

introducibleArr.append(robot)
introducibleArr.append(Cat(name: "고양이"))
introducibleArr.append(Dog(name: "강아지"))

for element in introducibleArr {
    if element is Robot {
        let instance = element as? Robot
        instance?.batteryCharge()
    } else if element is Cat {
        let instance = element as? Cat
        instance?.meow()
    } else if element is Dog {
        let instance = element as? Dog
        instance?.bark()
    } else {
        continue
    }
}


// 5.
// - throwing function 호출
do {
    try print(Required5()
        .predictDeliveryDay(for: "우리집", status: .notStarted))
} catch DeliveryError.notstarted {
    print("아직 배송이 시작되지 않았습니다.")
} catch DeliveryError.invalidAddress {
    print("유효하지 않은 주소입니다. 주소를 다시 입력해주세요.")
} catch DeliveryError.systemError(reason: let reason) {
    print("시스템 에러입니다. 사유: \(reason)")
}



//MARK: 도전 문제

// 1.
// - ElectricCar
let electric = ElectricCar(brand: "테슬라", model: "Y", modelYear: "2026")

electric.drive()
electric.stop()
electric.park()
print(electric.engine.type)

// - HybridCar
let hybrid = HybridCar(brand: "기아", model: "셀토스", modelYear: "2026")

hybrid.drive()
hybrid.switchEngine(to: .electric)
hybrid.switchEngine(to: .electric)
hybrid.switchEngine(to: .hydrogen)

/*
 Q. 상속을 사용하여 기능을 추가하는 것과, 프로토콜 채택을 통해서 기능을 추가하는 것의 장단점, 차이를 고민하고 주석으로 서술해주세요.
 A. 상속의 경우, 부모 클래스에 정의된 기능을 모두 사용할 수 있으며 재정의를 통해 커스텀할 수 있다는 장점이 있다. 그러나 상속 받은 클래스에는 필요 없는 부분까지 강제적으로 가져야한다는 단점이 있다.
    반면, 프로토콜은 프로토콜에 정의된 기능만 구현하면 된다는 장점이 있다. 클래스처럼 필요없는 기능까지 가지지 않으므로 공통된 몇 가지 기능(혹은 프로퍼티)만 가지길 원한다면 프로토콜이 유리하다.
    즉, 대부분 비슷하면서도 조금씩 차이를 갖는 경우라면 상속이, 공통적인 몇 가지만 여러 객체에서 가지길 원하는 경우라면 프로토콜을 사용하는 것이 좋다.
 */

