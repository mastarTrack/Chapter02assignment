
/* 필수 문제 1.
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


/* 1. 두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저*/
let closure: (Int, Int) -> String = {
    val1, val2 in
    return "두 수의 합은 \(val1 + val2)입니다."
}
//let closure: (Int, Int) -> String  = {
//    return "두 수의 합은 \($0 + $1)입니다."
//}
//print(closure(10,20))

/* 2. 클로저를 상수 sum에 저장하고, 정확한 타입을 명시*/
let sum: (Int, Int) -> String = closure

/* 3. sum을 호출하는 코드*/
print(sum(10,20))

/* 4. sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate */
// 방법 1. 클로저만을 파라미터로 받음(고정 데이터 처리 가능)
func calculate(calClosure: (Int, Int) -> String){
    let result = calClosure(20,20)
    print(result)
}

calculate(calClosure : sum)
//방법 2. 계산 인자와 클로저를 파라미터로 받음(함수 호출 시에 인자를 지정하여 사용 가능)
func calculate(val1 : Int, val2 :Int ,calClosure: (Int,Int)->String){
    let result = calClosure(val1, val2)
    print(result)
}
calculate(val1: 20, val2: 30, calClosure: sum)


/* 필수 문제 2.
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
     ```*/

/* 1. for-in -> map 변경*/
let numbers = [1,2,3,4,5]
var result = [String]()
result = numbers.map{String($0)}
print(result)

/* 2. 고차함수 체이닝 */
let num:[Int] = [1,2,3,4,5,6,7,8,9,10]
var res:[String] = num.filter{$0 % 2 == 0}.map{String($0)}
print(res)

/* 3. 고차함수 생성 (map, filter, reduce 사용X */
func myMap(_ arr:[Int], toStr: (Int) -> String) -> [String]{
    var myres: [String] = []
    for idx in arr{
        myres.append(toStr(idx))
    }
    return myres
}
let arr2 = myMap([1,2,3,4,5]){ //result는 위에서 사용 중이라 arr2로 대체했습니다.
    String($0)
}
print(arr2)



/* 필수 문제 3.
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

/* 1. `a` 함수 작성 */
func a(arr: [Int])->[Int]{
    var iArr: [Int] = []
    for idx in 0..<arr.count{
        if idx % 2 != 0{
            iArr.append(arr[idx])
        }
    }
    return iArr
}
let iArray = [1,2,3,4,5]
print(a(arr: iArray))

/* 2. `b` 함수 작성 */
func b(arr: [String])->[String]{
    var sArr: [String] = []
    for idx in 0..<arr.count{
        if idx % 2 != 0{
            sArr.append(arr[idx])
        }
    }
    return sArr
}
let sArray: [String] = ["가","나","다","라","마"]
print(b(arr: sArray))

/* 3. `c` 함수 작성 */
func c<T>(arr: [T])->[T]{
    var cArr: [T] = []
    for idx in 0..<arr.count{
        if idx % 2 != 0{
            cArr.append(arr[idx])
        }
    }
    return cArr
}
print(c(arr: iArray))
print(c(arr: sArray))


/* 4. `d` 함수 작성 */
func d<T: Numeric>(arr: [T])->[T]{
    var dArr: [T] = []
    for idx in 0..<arr.count{
        if idx % 2 != 0{
            dArr.append(arr[idx])
        }
    }
    return dArr
}
print(d(arr: iArray))
print(d(arr: [1.0,2.0,3.0,4.0,5.0]))



/* 필수 문제 4.
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

/* 1. Introducible 프로토콜 정의 */
protocol Introducible{
    var name: String {get set}
    func introduce()->String
}
/* 2. Robot 정의 */
class Robot: Introducible{
    var name: String{
        didSet{
            if oldValue != name{
                print("name 변경 알림")
                print("변경 이전 값: \(oldValue)")
                print("변경 이후 값: \(name)")
            }
        }
    }
    var batterySts: Int = 50

    func introduce()->String{
        return "안녕하세요. 저는 \(name)입니다."
    }
    func batteryCharge(){
        if batterySts == 100 {
            print("배터리 충전이 완료된 상태입니다.")
        }else {
            batterySts += 10
            print("배터리가 충전되었습니다.")
        }
        print("현재 배터리 잔량은 \(batterySts)입니다.")
    }
    
    init(name: String){
        self.name = name
    }
}
/* 3. Cat 정의 */
class Cat: Introducible{
    var name: String
    func introduce()->String{
        return "안녕하세요. 저는 \(name)입니다."
    }
    func meow(){
        print("고양이가 울고있습니다.")
    }
    init(name: String) {
        self.name = name
    }
}
/* 4. Dog 정의 */
class Dog: Introducible{
    var name: String
    func introduce()->String{
        return "안녕하세요. 저는 \(name)입니다."
    }
    func bark(){
        print("개가 짖고있습니다.")
    }
    init(name: String) {
        self.name = name
    }
}
/* 5. robot,cat,dog 인스턴스 생성 -> append */
var robot = Robot(name: "피규어")
var cat = Cat(name: "고양이")
var dog = Dog(name: "강아지")
var arr: [Introducible] = []
arr.append(robot)
arr.append(cat)
arr.append(dog)
/* robot name 변경 */
robot.name = "피규어"
robot.name = "옵티머스"
/* 배열 순회하며 고유 메서드 출력 */
for idx in arr{
    print(idx.introduce())
    if let r = idx as? Robot{
        r.batteryCharge()
    } else if let c = idx as? Cat{
        c.meow()
    } else if let d = idx as? Dog{
        d.bark()
    }
}




/* 필수 문제 5.
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


/* 1.DeliveryStatus Enum 구현 */
enum DeliveryStatus {
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
    
}
/* 2. DeliveryError 구현(Error Protocol) */
enum DeliveryError: Error{
    case invalidAddress
    case notStarted
    case systemError(reason: String)
}
/* 3. throwing function 구현 */
func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String{
    if address.isEmpty{
        throw DeliveryError.invalidAddress
    }
    switch status{
    case .notStarted:
        throw DeliveryError.notStarted
    case .error:
        throw DeliveryError.systemError(reason: "시스템에 오류가 있습니다.")
    case .inTransit(daysRemaining: let days):
        return "배송까지 \(days)일 남았습니다."
    }
}
/* 4. do-catch로 호출 */
do{
    let result = try predictDeliveryDay(for:"" ,status: .inTransit(daysRemaining: 3))
    print(result)
} catch DeliveryError.invalidAddress{
    print("주소가 입력되지 않았습니다.")
} catch DeliveryError.notStarted{
    print("배송이 아직 시작되지 않았습니다.")
} catch DeliveryError.systemError(reason: let reason){
    print("오류: \(reason)")
}



/* 도전 문제 1.
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

/* 1. Base Class `Car` 설계 */
class Car{
    private let brand: String
    private let model: String
    private let year: String
    public var engine: Engine
    private var isDrive: Bool = false
    private var battery: Int = 50
    public var fuel: Int = 95
    
    public func drive() {
        isDrive = true
        fuel -= 10
        print("Car 주행 중...")
    }
    public func stop(){
        isDrive = false
        print("Car 멈춤")
    }
    
    public func isDriving(){
        if isDrive == true{
            print("주행 중입니다.")
        }else{
            print("차가 멈춰있습니다.")
        }
    }
    
    public func charge(){
        if battery == 100{
            print("배터리 충전이 완료된 상태입니다.")
        }else{
            battery += 10
            print("현재 배터리 잔량은 \(battery)입니다.")
        }
    }
    
    private func isFull(){
        if fuel >= 100{
            print("연료가 가득찼습니다.")
        }
    }
    public func refuel(){
        if fuel >= 100{
            isFull()
        }else if (fuel + 20) >= 100{
            fuel = 100
            isFull()
        }else {
            fuel += 20
            print("현재 연료의 양은 \(fuel)입니다.")
        }
    }
    
    init(brand: String, model: String, year: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = engine
    }
}
/* 2. Custom Engine */
class Engine {
    var engineName: String
    
    init(engineName: String) {
        self.engineName = engineName
    }
}
/* 3. Engine 상속받는 ElectricEngine, HydrogenEngine */
class ElectricEngine: Engine {
    init() {
        super.init(engineName: "Electric Engine")
    }
}
class HydrogenEngine: Engine {
    init() {
        super.init(engineName: "Hydrogen Engine")
    }
}
/* 4. Car 상속받는 ElectricCar, HybridCar*/
class ElectricCar: Car{
}
class HybridCar: Car{
    /* 엔진을 런타임에 바꿀 수 있는 `switchEngine(to:)` */
    func switchEngine(to newEngine: Engine){
        engine = newEngine
    }
}
/* 5. `HybridCar` 인스턴스를 생성 */
var hybridcar = HybridCar(brand: "현대", model: "제네시스", year: "2025", engine: ElectricEngine())
print(hybridcar.engine.engineName)
/* 6. `switchEngine(to:)` 를 호출 */
hybridcar.switchEngine(to: HydrogenEngine())
print(hybridcar.engine.engineName)
//hybridcar.drive()
//hybridcar.stop()
//hybridcar.isDriving()
//hybridcar.drive()
//hybridcar.isDriving()
//hybridcar.charge()
//hybridcar.refuel()
//hybridcar.drive()
//print(hybridcar.fuel)

/* 7. 상속을 이용한 기능 추가, 프로토콜을 추가하여 기능 추가의 장,단점
 1. 상속
 - 장점: 부모 클래스의 프로퍼티, 메소드를 바로 사용가능함.(생산성, 재사용성이 높음)
 - 단점: 다중 상속이 불가능하다. 결합도가 높아서 유연하지 못함
 
 2. 프로토콜
 - 장점: 다중 채택이 가능하다.(효율적, 유연함)
 - 단점: 상속과 달리 공통로직도 매번 구현해야함.(혹은, Extension)
 */



/* 도전 문제 2.
 - [ ]  SortableBox 라는 이름의 제네릭 구조체를 정의해주세요.
     - 타입 파라미터는 1개이며, T 라는 이름으로 지정합니다.
 - [ ]  SortableBox 에 인스턴스 프로퍼티 `var items: [T]` 를 추가해주세요.
 - [ ]  타입 T 가 Comparable을 준수할 때에만 sortItems() 메서드를 사용할 수 있도록 구현하세요.
     - sortItems() 메서드는 items 배열을 오름차순으로 정렬합니다.
     - 정렬 결과는 items 프로퍼티에 반영되어야 합니다.
 - [ ]  T 가 Comparable 을 따르지 않는 타입일 경우, sortItems() 호출 시 컴파일 오류가 발생해야합니다.
 */

/* 1. 제네릭 구조체 정의, 2. 프로퍼티 추가 */

struct SortableBox<T>{
    var items: [T]
    /* 3.1 sortItems() 메서드 구현 */
    mutating func sortItems() where T: Comparable{
        self.items.sort()
    }
}

/* 3.2 sortItems() 메서드 구현(Extension 사용) */
//struct SortableBox<T>{
//    var items: [T]
//}
//
//extension SortableBox where T: Comparable{
//    mutating func sortItems(){
//        items.sort()
//    }
//}

/* 테스트용(Comparable 준수) */
var intbox = SortableBox(items: [4,2,3,1])
intbox.sortItems()
print(intbox.items)
/* 테스트용(Comparable 미준수) */
var boolbox = SortableBox(items: [true, false, true, false])
/* Comparable 타입이 아닐 경우 sortItems() 호출 시 오류 발생*/
//boolbox.sortItems()



///* 도전 문제 3.
// 필수문제 4 구현에서 연속된 문제입니다.
//
// - [ ]  Introducible 프로토콜을 채택하는 타입들에게 **기본 introduce() 동작**을 제공하세요.
//     - 각 타입들이 introduce() 를 구현하지 않고도  introduce() 를 호출할 수 있어야합니다.
// - [ ]  Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
//     - 이 때, Robot 타입은  **기본 introduce() 동작** 이 아닌 커스텀 동작을 하도록 구현해주세요.
// */
//
///* 1. Introducible 프로토콜 정의 */
//protocol Introducible{
//    var name: String {get set}
//    func introduce()->String
//}
///* 2. protocol extension 정의 */
//extension Introducible{
//    func introduce() -> String {
//        return "안녕하세요. 저는 \(name)입니다."
//    }
//}
///* 3. Robot 정의 */
//class Robot: Introducible{
//    var name: String
//    func introduce() -> String {
//        return "I am a robot. My name is \(name)."
//    }
//    init(name: String){
//        self.name = name
//    }
//}
///* 4. Cat 정의 */
//class Cat: Introducible{
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
///* 5. Dog 정의 */
//class Dog: Introducible{
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
///* 테스트용 */
//var robot = Robot(name: "피규어")
//var cat = Cat(name: "고양이")
//var dog = Dog(name: "강아지")
//print(robot.introduce())
//print(cat.introduce())
//print(dog.introduce())



/* 도전 문제 4.
 - [ ]  클래스 A, B 사이에 순환참조가 발생하도록 구현해주세요.
     - 각 클래스에 `deinit` 을 정의하여, 메모리 해제 여부를 확인할 수 있도록 해주세요.
 - [ ]  또한 클래스 B 에는 `closure: (() -> Void)?` 프로퍼티를 만들고, 클로저 내부에서 `A`의 인스턴스를 참조하게 하여 클로저 기반의 순환 참조도 발생시켜보세요.
 - [ ]  순환 참조를 해결할 수 있도록 weak, unowned 키워드를 클로저 캡처 리스트를 적절히 사용하여 순환 참조를 해결해주세요.
 */

class A{
    let name: String
    init(name: String){
        self.name = name
    }
    var B: B?
    deinit{ print("\(name) is deinitialized")}
}

class B{
    let age: Int
    init(age: Int) {
        self.age = age
    }
    weak var A: A?
    deinit{ print("\(age) is deinitialized")}
    
    var closure: (()->Void)?
}

var a: A? = A(name: "A") // A RC: 1, B RC: 0
var b: B? = B(age: 26) // A RC: 1, B RC: 1

a?.B = b // A RC: 1, B RC: 2
b?.A = a // A RC: 1, B RC: 2
b?.closure = { [weak a] in
        print("\(a?.name ?? "없음")")
} // A RC: 1, B RC: 2

a = nil // A RC: 0, B RC: 1 -> A.deinit 출력
b = nil // A RC: 0, B RC: 0 -> B.deinit 출력
