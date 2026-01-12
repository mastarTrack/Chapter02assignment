# CH 2. 프로그래밍 기초 주차 과제

## 필수문제 1) 클로저 사용하기
클로저란 하나의 값처럼 여기저기 전달해서 쓸 수 있는 기능을 가진 코드 덩어리이다.
확장된 함수라고도 할 수 있는데, 함수가 이름이 있는 클로저고 클로저는 이름이 없을 수도 있는 함수이다.

후행 클로저를 사용하면 이런 식으로 축약해서 표현이 가능하다.
```swift
// {(num1: Int, num2: Int) -> String in return "두 수의 합은 \(num1 + num2) 입니다"}
let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다" }
```
## 필수문제 2) 고차함수 사용하기
`.`으로 이어서 체이닝하여 사용할 수도 있다.
```swift
let oneToTen = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let resultArr = oneToTen.filter { $0 % 2 == 0 }.map { "\($0)" }
```
## 필수문제 3) 제네릭 <T> 사용하기
`Type parameter`는 `placeholder(자리표시자) type`을 지정하고 이름을 지정하며, 함수명 바로 뒤에 꺾쇠 괄호(예: `<T>`) 사이에 작성됨
괄호 안에 여러 개의 타입 매개변수 이름을 쉼표로 구분하여 작성하면 두 개 이상의 타입 매개변수를 제공할 수 있다.
```swift
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
```
제네릭 함수의 경우 `Int`나 `String`같은 실제 타입 이름이 아닌 T라고 칭한다
`T`가 무엇이어야 하는지에 대한 내용은 없지만, `T`가 무엇을 나타내든 입출력값 모두 같은 유형 `T`여야 한다고 명시하고 있다
`T` 대신 사용할 실제 유형은 해당 함수가 호출될 때마다 결정, 함수에 전달된 값의 유형에서 `T`에 사용할 유형을 추론한다
`T`는 자리 표시자이므로 `Swift`는 `T`라는 실제 타입을 찾지는 않는다

## 필수문제 4) 타입 캐스팅, 프로퍼티 옵저버 (Property Observer)

### 타입 캐스팅
```swift
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
```
처음에는 단순하게 생각해서 해당 인스턴스에 접근해서 메서드를 쓰면 되겠다고 생각했다. 
하지만 저런 식으로 `introducible` 타입 `Array`에 넣으니 타입이 `introducible`이 되고 따로 타입을 정해주지 않고서는 해당 객체의 메서드를 사용하지 못했다. 그래서 `is` 와 `as`를 사용해서 타입 캐스팅을 해서 메서드에 접근할 수 있었다. 

### 프로퍼티 옵저버

저장 프로퍼티의 값이 변경되는 것을 감시하고 있다가 코드블록을 실행 할 수 있는 기능이다.
`willSet(새로운 변수명) {` , `didSet(새로운 변수명) {` 으로 변수명 따로 사용가능하다.

```swift
class Robot: Introducible {
    var name: String = "로봇" {
        didSet(oldName) {
            guard oldName != name else { return }
            print("name 변경 알림 \n변경 이전 값: \(oldName) \n변경 이후 값: \(name)")
        }
    }
}
```

## 도전문제 1) 접근제어자, prorocol 준수하기
### 접근제어자
```swift
class Car {
    let brand: String
    let model: String
    let year: String
    fileprivate(set) var engine: Engine
    //main에서 볼수는 있는데 엔진을 임의로 바꿀수 없게
    
    init(brand: String, model: String, year: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = engine
    }
}

class HybridCar: Car {
    init(brand: String, model: String, year: String) {
        super.init(brand: brand, model: model, year: year, engine: HydrogenEngine())
    }
    
    func switchEngine(to newEngine: Engine) {
        engine = newEngine
        print("\(newEngine.type)엔진으로 교체")
    }
}
```
위의 코드와 같이 `fileprivate(set)` 접근제어자를 이용해 파일 외부에서는 HybridCar 인스턴스에 접근해서 엔진을 바꿀 수 없게 의도했다.
엔진을 교체하기 위해서는 `switchEngine(to newEngine:)`를 호출해야 한다.

### protocol

```swift
protocol CarProtocol {
    var brand: String { get }
    var model: String { get }
    var year: String { get }
    var engine: any EngineProtocol { get }
    
    func drive()
    func stop()
}

protocol EngineSwitchableCar: CarProtocol {
    var engine: any EngineProtocol { get set }
    mutating func switchEngine(to newEngine: any EngineProtocol)
}

```
기능에 따라 `protocol`을 나누고 알맞은 `struct`들이 이 프로토콜을 준수하게 했다.
전기차는 엔진이 바뀌는 기능은 없기에 `CarProtocol`을 준수하도록 했고
반대로 하이브리드차는 엔진을 바꿀 수 있기에 `EngineSwitchableCar`를 준수하게 했다.

```swift
struct ElectricCarS: CarProtocol { ... }
struct HybridCarS: EngineSwitchableCar { ... }
```
## 도전문제 2) where 사용
`where`는 해당 코드가 동작하기 위해서는 만족해야하는 조건을 나타내준다. 조건을 뒤에 붙이는 필터라고 할 수 있다.
제네릭 타입의 제약이나 제네릭 타입 간의 관계를 나타내기에 편리하다.
`if`는 실행흐름을 제어한다면 `where`는 문법적 제약이나 조건을 걸러준다.

```swift
struct SortableBox<T> {
    var items: [T]

    mutating func sortItems() where T: Comparable {
           items.sort()
    }
}
```
## 도전문제 3) protocol과 extension 사용
`protocol`을 사용하면 `protocol` 내부에서는 함수 안의 내용을 정의할 수 없다. 
하지만 `extension` 사용 시 `protocol`을 준수하는 모든 인스턴스가 해당 함수를 사용할 수 있게 만들 수 있다.

```swift
protocol Introducible {
    var name: String { get set }
    func introduce() -> String
}

extension Introducible {
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
}
```

## 도전문제 4) 순환참조와 weak 사용

`weak`은 순환참조가 되지 않도록 참조 카운트를 `+`하지 않는다.
`weak`으로 참조하더라도 그 대상의 생명주기에 영향을 끼치지 않는다.
`weak` 키워드가 붙으면 항상 `Optional` 타입이다 (대상 해제시 `nil` 로 바뀜)
위의 특징 덕분에 안전하고 참조대상이 사라질 수도 있을 때 사용한다.

```swift
final class A {
    var b: B?

    deinit {
        print("🅰️ A deinit")
    }
}

final class B {
    weak var a: A? //약한 참조
    var closure: (() -> Void)?

    deinit {
        print("🅱️ B deinit")
    }
}

func makeMemoryLeak() {
    print("memory leak start")
    
    let a = A()
    let b = B()
    
    //참조순환
    a.b = b
    b.a = a

    //클로저 기반 순환참조
    b.closure =
    { [weak a] in
        guard let a else { return }
        print("b 클로저 안에서 a 참조하기: \(a)")
    }
    b.closure?()
    
    print("memory leak end")
}
```
+) `unowned`도 `weak`과 똑같이 참조 카운트를 하지 않는다. 
하지만 다른 점이 있다면 이 참조 대상은 나보다 오래 살거나, 최소한 나랑 같은 생명주기를 가진다는 강한 확신을 코드로 표현하는 것이다. 때문에 확신이 있을 때만 사용을 권장한다. 
