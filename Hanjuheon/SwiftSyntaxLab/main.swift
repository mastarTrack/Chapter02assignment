//
//  main.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/6/26.
//
//
import Foundation

/*
 # 필수 문제 1번
 
 - [ ]  두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
 - 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
 - [ ]  이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요.
 
 ```swift
 var num: Int = 3
 ```
 
 - [ ]  sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
 - [ ]  위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
 1. (조건) calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함해야합니다.
 */

print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 01\n")

// 인트형 파라매터 2개를 받고 문자열을 반환하는 클로져 생성
let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다." }

// 클로저 호출
let result01 = sum(3,5)


// 클로저를 매개변수로 받는 함수
func calculate(_ a:Int, _ b: Int, _ sum: (Int,Int) -> String) -> Void {
    print(sum(a,b))
}

// 제작한 sum 클로져를 매게변수로 사용
calculate(5, 5, sum)

// 트레일러클로저를 생성하여 매개변수로 사용
calculate(3,5){ "두 수의 합은 \($0 + $1) 입니다."}

print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 02\n")
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
 - [ ]  아래 for-in 문을 map 을 사용하는 코드로 변환해주세요.
 
 ```swift
 let numbers = [1, 2, 3, 4, 5]
 
 var result = [String]()
 
 for number in numbers {
 result.append(number)
 }
 ```
 
 - [ ]  주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
 - 입력: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] - 타입: Array<Int>
 - 출력: [”2”, “4”, “6”, “8”, “10”] - 타입: Array<String>
 - 힌트
 
 map 과 filter 를 이용해볼 수 있을 것 같습니다.
 
 - [ ]  이제 고차함수를 직접 만들어 봅니다.
 - 함수명: myMap
 - 파라미터는 2개 입니다.
 1. 배열: [Int]
 2. 변환 클로저: (Int) → String
 - 반환 값은 1개 입니다.
 1. [String]
 - myMap 함수 구현 내부에서 map, filter, reduce 등 고차함수를 직접 사용하지 않아야합니다.
 - 완성된 myMap 호출 예시
 
 ```swift
 let result = myMap([1, 2, 3, 4, 5]) {
 String($0)
 }
 
 print(result) // ["1", "2", "3", "4", "5"]
 ```
 */


var numbers = [1, 2, 3, 4, 5]

// for문을 고차함수 map을 이용하여 변경
var result02 = numbers.map{"\($0)"}
print("필수 문제 2 - 1 결과값 출력")
print(result02)

// 다음 문제 풀이를 위해 요소 추가
numbers.append(contentsOf: [6,7,8,9,10])

// 배열에서 짝수 값을 추출하여 문자로 변환하는 함수 선언
func changeArrIntToArrStr (_ arrayInt: [Int])->[String] {
    return arrayInt.filter {$0%2==0}.map{"\($0)"}
}

// 함수호출
result02 = changeArrIntToArrStr(numbers)

// 결과값 출력
print("필수 문제 2 - 2 결과값 출력")
print(result02)

func customMap(_ arrInt: [Int], _ changeClosure: ((Int)->String)) ->[String]{
    var mapResult: [String] = []
    for intValue in arrInt{
        mapResult.append(changeClosure(intValue))
    }
    return mapResult
}

result02 = customMap([1,2,3,4,5]){"\($0)"}
print("필수 문제 2 - 3 결과값 출력")
print(result02)

print("\n\n ----------------------------------------- \n\n")
print("# 필수문제 풀이 03")
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
 - [ ]  Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 `a` 를 작성해주세요.
 - 테스트 입력: [1, 2, 3, 4, 5]
 - 테스트 출력: [2, 4]
 - [ ]  String 배열의 짝수번째 요소를 제거해서 반환하는 함수 `b` 를 작성해주세요.
 - 테스트 입력: [”가”, “나”, “다”, “라”, “마”]
 - 테스트 출력: [”나”, “라”]
 - [ ]  위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 `c` 로 작성해주세요.
 - [ ]  테스트 입력들을 넣고 호출하여 출력이 제대로 나오는지 작성해주세요.
 - 테스트 입력: [1, 2, 3, 4, 5], [”가”, “나”, “다”, “라”, “마”]
 - 테스트 출력: [2, 4], [”나”, “라”]
 - [ ]  함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
 - 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.
 */


let arrInt: [Int] = [1,2,3,4,5]
let arrStr: [String] = ["가","나","다","라","마"]

// 지정 데이터 타입 매개변수를 이용한 함수
func removeIntArrEvenIndex(_ target: [Int])->[Int] {
    // # 반복문과 의문문을 이용한 문제 해결
    var result: [Int] = []
    for i in 0..<target.count{
        if i%2==1{
            result.append(target[i])
        }
    }
    print("반복문 및 의무문 조합 풀이: \(result)")
    
    // # 고차 함수를 이용한 문제 해결 - 1
    result = target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
    print("고차함수 풀이 1: \(result)")
    
    // # 고차 함수를 이용한 문제 해결 - 2
    result = target.enumerated()
        .compactMap { (index, value) in
            index % 2 == 1 ? value : nil
        }
    print("고차함수 풀이 2: \(result)")
    
    return result
}

// 제네릭을 이용하여 다양한 타입을 받아 처리할 수 있는 함수
func removeEvenIndex<T>(_ target: [T])->[T]{
    return target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
    
}

// 뉴머릭 제약 조건 추가 함수
func removeEvenIndexAtNumeric<T: Numeric>(_ target: [T])->[T]{
    return target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
}


print(removeEvenIndexAtNumeric(arrInt))
print(removeEvenIndex(arrStr))


print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 04\n")
/*
 우리는 여러 타입에 “자기소개” 기능을 부여하고자 합니다.
 
 - [ ]  Introducible 프로토콜을 정의하세요.
 - name: String 프로퍼티를 요구사항으로 포함합니다.
 - introduce() -> String 메서드를 요구사항으로 포함합니다.
 - 동작 예시: print("안녕하세요, 저는 \(name)입니다.")
 - [ ]  Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
 - [ ]  Robot 타입의 경우, name 값이 변경될 때마다 변경 이전값과 이후 값을 출력하도록 구현해주세요.
 - 만약 변경 이전값과 이후값이 같다면 출력하지 않아야합니다.
 - 출력 예시
 
 ```swift
 name 변경 알림
 변경 이전 값: 피규어
 변경 이후 값: 옵티머스
 ```
 
 - [ ]  Introducible 프로토콜 에 정의되지 않은 각 타입 고유의 메서드들도 하나씩 추가 정의해주세요.
 - 예를 들어, Robot 은 충전하기(batteryCharge) 라는 메서드를 추가 할 수 있습니다.
 - [ ]  `[Introducible]` 타입 배열을 정의하고, Robot, Cat, Dog 인스턴스 1개씩을 append 해주세요.
 - 배열을 순회하며 각 타입 고유의 메서드들을 호출하는 코드를 작성해주세요.
 */

protocol Introducible{
    var name:String {get set}
}


class Robot: Introducible{
    var name: String{
        willSet{
            guard newValue != name else {return}
            print("name 변경 알림\n변경 이전 값:\(name)")
        }
        didSet{
            guard oldValue != name else {return}
            print("변경 이후 값:\(name)")
        }
    }
    
    init(name: String){
        self.name = name
    }
    
//    func introduce()-> String{
//        return  "안녕하세요, 저는 \(name)입니다."
//    }
    
    func chargingBattary(){
        print("\(name)이(가) 배터리를 충전합니다.")
    }
}

class Dog: Introducible{
    var name: String
    
    init(name: String){
        self.name = name
    }
    
//    func introduce()-> String{
//        return  "안녕하세요, 저는 \(name)입니다."
//    }
    func sit(){
        print("\(name)이(가) 제자리에 앉았습니다.")
    }
}

class Cat: Introducible{
    var name: String
    
    init(name: String){
        self.name = name
    }
    
//    func introduce()-> String{
//        return  "안녕하세요, 저는 \(name)입니다."
//    }
    func knead(){
        print("\(name)이(가) 꾹꾹이를 해줍니다.")
    }
}

var robot:Robot = Robot(name: "태권브이")
let dog:Dog = Dog(name: "백구")
let cat:Cat = Cat(name: "나비")

let introducible:[Introducible] = [robot,dog,cat]

// 2026/01/09 refector
// 이중 타입 체크로인한 리소스 낭비 코드 수정
for intro in introducible{
    switch intro{
    case let robot as Robot:
        robot.chargingBattary()
    case let dog as Dog:
        dog.sit()
    case let cat as Cat:
        cat.knead()
    default:
        print("특수 행동이 없습니다.")
    }
}



print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 05\n")
/*
 우리는 간단한 **택배 도착 예측 시스템**을 만들고 있다고 가정합니다.
 
 사용자에게 예상 도착일을 알려주려 하지만, 다음과 같은 여러 상황에서 문제가 발생할 수 있습니다:
 
 - 주소가 잘못된 경우
 - 배송이 아직 시작되지 않은 경우
 - 시스템 서버 에러로 예측이 불가능한 경우
 - [ ]  배송 상태를 표현하는 DeliveryStatus 열거형을 구현하고, 아래 3가지 상태를 포함하도록 합니다.
 - notStarted
 - inTransit(daysRemaining: Int)
 - error
 - [ ]  사용자 정의 에러 타입 DeliveryError를 Error 프로토콜을 따르도록 정의합니다.
 - invalidAddress
 - notStarted
 - systemError(reason: String)
 - [ ]  아래 시그니처를 가진 throwing function 을 구현해봅니다.
 
 ```swift
 func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String
 ```
 
 - 주소가 빈 문자열이면 DeliveryError.invalidAddress를 던져야 합니다.
 - 배송이 아직 시작되지 않은 경우 DeliveryError.notStarted를 던져야 합니다.
 - 시스템 에러 상태면 DeliveryError.systemError(reason:)을 던져야 합니다.
 - 나머지 경우에는 "배송까지 X일 남았습니다." 형태의 문자열을 반환합니다.
 - [ ]  위 함수를 do-catch 로 호출하고, 각 에러 상황에 따라 사용자에게 다른 메시지를 출력하세요.
 */


// DeliveryStatus 열거형 생성
enum DeliveryStatus{
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
}

// Error 열거형 생성
enum DeliveryError: Error{
    case invalidAddress
    case notStarted
    case systemError(reason: String)
    
    
}

// 2026/01/09 refector
// Switch 문으로 변환

// guard를 이용하여 상태 확인
func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String{
    /* guard 로 구현한 코드
     guard !address.isEmpty else{
     throw DeliveryError.invalidAddress
     }
     guard case .notStarted = status else {
     throw DeliveryError.notStarted
     }
     guard case .error = status else {
     throw DeliveryError.systemError(reason: "시스템 에러가 발생하였습니다.")
     }
     
     guard case .inTransit(let daysRemaining) = status else {
     return "배송일에 문제가 있습니다."
     }
     
     return "배송까지\(daysRemaining)일 남았습니다."
     */
    
    guard !address.isEmpty else{
        throw DeliveryError.invalidAddress
    }
    
    switch status {
    case .notStarted:
        throw DeliveryError.notStarted
        
    case .error:
        throw DeliveryError.systemError(reason: "시스템 에러가 발생하였습니다")
        
    case .inTransit(let daysRemaining):
        return "배송까지 \(daysRemaining)일 남았습니다."
    }
}


// 2026/01/09 refector
// 상위 함수랑 동일한 코드가 작성되어 있어 함수 호출로 변경

// Do-Catch 문으로 변환
func predictDeliveryDayAnDoCatch(for address: String, status: DeliveryStatus) throws -> String{
    do{
        let result = try predictDeliveryDay(for: address, status: .notStarted)
        return result
    }catch DeliveryError.invalidAddress{
        return "빈 주소값이 입력되었습니다. 확인 부탁드립니다."
    }catch DeliveryError.notStarted{
        return "아직 상품이 배송되지 않았습니다."
    }catch DeliveryError.systemError(let errorText){
        return errorText
    }catch{
        return ("\(error)")
    }
}


print("\n\n -----------------------------------------")
print("\n# 도전문제 풀이 01\n")
/*
 - ‘자동차’ 라는 개념을 가지고 객체 지향 설계를 해봅니다.
 - [ ]  Base Class `Car` 를 설계해주세요.
 - 4가지의 상태를 정의해주세요.
 - 브랜드, 모델, 연식
 - 모두 String 타입입니다.
 - 엔진
 - Engine 이라는 커스텀 타입으로 정의해주세요.
 - 1개의 동작을 정의해주세요.
 - 운전하기
 - 동작 예시) “Car 주행 중…”  출력
 - 추가하고 싶은 상태와 동작은 마음껏 추가해주세요.
 - stop(), charge(), refuel() 등..
 - 정의한 각 상태 및 동작에 적절한 접근 제어자를 명시적으로 지정해주세요.
 - [ ]  `Car` 를 상속한 `ElectricCar` 를 설계해주세요.
 - ElectricEngine 타입의 Engine 을 사용해야합니다.
 - [ ]  `Car` 를 상속한 `HybridCar` 를 설계해주세요.
 - 새로운 엔진 타입 `HydrogenEngine` 을 정의해주세요.
 - HybridCar 에는 기존 Car 에 없던 새로운 동작이 추가됩니다.
 - 엔진을 런타임에 바꿀 수 있는 `switchEngine(to:)` 입니다.
 - [ ]  `HybridCar` 인스턴스를 생성하고, `switchEngine(to:)` 를 호출하여 서로 다른 타입의 엔진으로 교체하는 코드를 작성해주세요.
 - [ ]  상속을 사용하여 기능을 추가하는 것과, 프로토콜 채택을 통해서 기능을 추가하는 것의 장단점, 차이를 고민하고 주석으로 서술해주세요.
 */

// 엔진 프로토콜 생성
protocol Engine{
    var engineTurnOnOff: Bool {get set}
    mutating func turnOnOffengine(_ onOff:Bool)->Void
    func checkEngine()->Bool
}

// 기름 엔진 구조체 생성
class OilEngine: Engine {
    
    var engineTurnOnOff: Bool = false
    
    func turnOnOffengine(_ onOff: Bool)->Void {
        engineTurnOnOff = onOff
        
        if onOff {
            print("엔진을 켰습니다.")
        } else {
            print("엔진을 껐습니다.")
        }
    }
    func checkEngine()->Bool{
        return engineTurnOnOff
    }
}

// 전기차 엔진 구조체 생성
class ElectricEngine: Engine{
    var engineTurnOnOff: Bool = false
    
    func turnOnOffengine(_ onOff: Bool)->Void {
        engineTurnOnOff = onOff
        
        if onOff {
            print("엔진을 켰습니다.")
        } else {
            print("엔진을 껐습니다.")
        }
    }
    func checkEngine()->Bool{
        return engineTurnOnOff
    }
}

// 하이브리트차 엔진 구조체 생성
class HydrogenEngine: Engine{
    var engineTurnOnOff: Bool = false
    
    func turnOnOffengine(_ onOff: Bool)->Void {
        engineTurnOnOff = onOff
        
        if onOff {
            print("엔진을 켰습니다.")
        } else {
            print("엔진을 껐습니다.")
        }
    }
    func checkEngine()->Bool{
        return engineTurnOnOff
    }
}


// 자동차 클래스 정의
internal class car {
    internal var brand: String
    internal var model: String
    internal var modelYear: String
    private var fuelGagage: Int
    internal var engine: Engine
    
    init(model:String,
         brand:String,
         modelYear:String,
         oilGagage:Int,
         engine:Engine){
        self.model = model
        self.brand = brand
        self.modelYear = modelYear
        self.fuelGagage = oilGagage
        self.engine = engine
    }
    
    internal func Driving(){
        guard engine.checkEngine() else{
            print("시동이 꺼져있습니다.")
            return
        }
        guard fuelGagage != 0 else{
            print("연료가 없습니다.")
            return
        }
        fuelGagage -= 10
        print("Car 주행중...")
    }
    
    internal func turnOnOffEngine(){
        engine.turnOnOffengine(true)
    }
}

//전기차 정의
internal class electricCar: car{ }

// 하이브리드 차 정의
internal class hybridCar: car{
    func switchEngine(to setEngine: Engine) {
        engine = setEngine
    }
}

//자동차의 대한 프로토콜 정의
protocol carToProtocol{
    var brand: String {get set}
    var model: String {get set}
    var modelYear: String {get set}
    var fuelGagage: Int {get set}
    var engine: Engine {get set}
    
    func Driving()->Void
    func turnOnOffEngine()->Void
}


/*
 클래스 상속의 장단점
 장점: 부모의 프로퍼티와 메소드를 그대로 재사용할 수 있다,
 단점: 단일상속만 가능하다. 클래스만 상속이 가능하다.
 
 프로토콜 채택의 장단점
 장점: 클래스 외에도 struct, enum등 유연하게 사용가능하며, 다중채택이 가능하다.
 단점: 프로토콜을 채택할때마다 선언된 프로퍼티와 메소드를 초기화 및 구현을 해줘야한다.
 */


print("\n\n -----------------------------------------")
print("\n# 도전문제 풀이 02\n")
/*
 - [ ]  SortableBox 라는 이름의 제네릭 구조체를 정의해주세요.
 - 타입 파라미터는 1개이며, T 라는 이름으로 지정합니다.
 - [ ]  SortableBox 에 인스턴스 프로퍼티 `var items: [T]` 를 추가해주세요.
 - [ ]  타입 T 가 Comparable을 준수할 때에만 sortItems() 메서드를 사용할 수 있도록 구현하세요.
 - sortItems() 메서드는 items 배열을 오름차순으로 정렬합니다.
 - 정렬 결과는 items 프로퍼티에 반영되어야 합니다.
 - [ ]  T 가 Comparable 을 따르지 않는 타입일 경우, sortItems() 호출 시 컴파일 오류가 발생해야합니다.
 */

struct SortableBox<T: Comparable>{
    var items: [T]
    
    mutating func sortItem(){
        items.sort(by: >)
    }
}

print("\n\n -----------------------------------------")
print("\n# 도전문제 풀이 03\n")
/*
 필수문제 4 구현에서 연속된 문제입니다.

 - [ ]  Introducible 프로토콜을 채택하는 타입들에게 **기본 introduce() 동작**을 제공하세요.
     - 각 타입들이 introduce() 를 구현하지 않고도  introduce() 를 호출할 수 있어야합니다.
 - [ ]  Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
     - 이 때, Robot 타입은  **기본 introduce() 동작** 이 아닌 커스텀 동작을 하도록 구현해주세요.
 */

extension Introducible {
    func introduce()-> String{
        return  "안녕하세요, 저는 \(name)입니다."
    }
}

extension Robot{
    func introduce()->String{
        return "삐빅, 저. 의. 이. 름. 은. [\(name)] 입. 니. 다."
    }
}

print(robot.introduce())
print(cat.introduce())
print(dog.introduce())


print("\n\n -----------------------------------------")
print("\n# 도전문제 풀이 04\n")
/*
 - [ ]  클래스 A, B 사이에 순환참조가 발생하도록 구현해주세요.
     - 각 클래스에 `deinit` 을 정의하여, 메모리 해제 여부를 확인할 수 있도록 해주세요.
 - [ ]  또한 클래스 B 에는 `closure: (() -> Void)?` 프로퍼티를 만들고, 클로저 내부에서 `A`의 인스턴스를 참조하게 하여 클로저 기반의 순환 참조도 발생시켜보세요.
 - [ ]  순환 참조를 해결할 수 있도록 weak, unowned 키워드를 클로저 캡처 리스트를 적절히 사용하여 순환 참조를 해결해주세요.
 */


// 생성자 및 소멸자 확인


var a:A? = A(name: "Gang",age: "00", address: "Seoul",education: nil)  // RC:0
var b:B? = B(schoolName: "Seoul", major: "Software", information: nil) // RC:0
a = nil
b = nil

print(" ------ ")
// 순환참조 진행
func testARC(){
    var c:A? = A(name: "Gang",age: "00", address: "Seoul",education: nil) //C RC:0
    var d:B? = B(schoolName: "Seoul", major: "Software", information: nil)//D RC:0
    c?.education = d  // RC:1
    d?.information = c// RC:1
    
    // 클로저 기반 순환참조
    
    /*
     # 순환참조가 아닌 이유
     클로저에 할당된 d는 외부 참조값으로 할당된것이기에 d = nil 진행하면 참조값이 사라지며 클로져로 인한 순환참조가 이루어 지지않는다.
     */
    //d?.closure = { print("이름: \(d!.information!.name)")}
    //d?.closure?()
    
    // 클로저 순환참조 진행
    d?.setClosure()
    
    c?.education = nil
    d?.information = nil
    
    c = nil  // C RC: 1 -> 메로리 해제 안됨
    d = nil  // D RC: 1 ->  메로리 해제 안됨
}

testARC()

// ------ weak 키워드 사용
print("\n --- weak --- ")

var aa:C? = C(name: "Gang",age: "00", address: "Seoul",education: nil)
var bb:D? = D(schoolName: "Seoul", major: "Software", information: nil)

aa?.education = bb
bb?.information = aa

// 클로저 기반 순환참조
bb?.setClosure()

aa?.education = nil
bb?.information = nil
aa = nil
bb = nil

