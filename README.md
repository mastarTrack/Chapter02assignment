
# [내배캠] Ch2. 프로그래밍 기초 주차 과제 풀이

## main.swift
문제에서 구현한 함수를 호출하는 파일입니다.

각 과제는 대부분 클래스로 구현된 경우를 제외하고 구조체로 작성되었습니다. 해당하는 구조체를 생성하여 함수를 호출합니다.

## 필수 문제
### 4) 여러 타입에 "자기소개" 기능 부여하기
각 객체의 고유 메서드를 호출하는 함수의 경우, 처음에는 `introducibleArr.enumerated().forEach`를 활용하였습니다.

```swift
introducibleArr.enumerated().forEach { index, element in
    switch index {
    case 0:
        let instance = element as? Robot
        instance?.batteryCharge()
    case 1:
        let instance = element as? Cat
        instance?.meow()
    case 2:
        let instance = element as? Dog
        instance?.bark()
    default:
        break
    }
}
```

그러나 위 방법은 인스턴스 자체의 타입보다 배열의 인덱스에 의존한다고 판단했습니다.
따라서 for-in 반복문과 `is` 연산자를 활용하여 인스턴스의 타입을 매칭하는 방법으로 수정하였습니다.

## 도전 문제
### 1) '자동차' 개념으로 객체 지향 설계하기
**1️⃣ 커스텀 Engine 타입**

처음에는 열거형 타입으로 정의했으나 제시문에서 'ElectricEngine 타입의 Engine 을 사용해야합니다.' 라는 언급이 있어 클래스로 바꾸었습니다.

각 자식 클래스(`ElectricEngine` 등)는 엔진 타입을 내부에서 주어진 기본값으로 초기화합니다.

열거형 `EngineType`은 `switchEngine(to:)` 함수에서 인자를 안전하게 입력받기 위해 남겨두었습니다.

**2️⃣ HydrogenEngine**
```swift
class HydrogenEngine: Engine {
    // 현재 작동 중인 엔진
    private var running: Engine = GasolineEngine() {
        didSet {
            print("현재 작동 중인 엔진이 \(oldValue.type)에서 \(running.type)으로 변경되었습니다.")
        }
    }
```

다른 엔진 자식 클래스와 달리 현재 작동중인 엔진을 의미하는 `running` 변수를 가집니다.

`HybridCar`는 `HydrogenEngine`을 가지는데, `switchEngine(to:)`를 한다고 해서 `HybridCar.engine`이 `HydrogenEngine`이 아닌 완전히 다른 엔진으로 바뀌어서는 안된다고 생각했기 때문입니다. (그러면 더이상 하이브리드 차가 아니지 않을까라고 생각했습니다.)

따라서 작동 중임을 나타내는 변수를 따로 정의하였습니다.

`running` 변수는 엔진의 동작으로만 변경될 수 있도록 `private` 접근자를 사용하였습니다.
프로퍼티 옵저버를 통해 어떻게 변경되었는지도 알 수 있도록 하였습니다.
    
```swift
    // 엔진 전환
    func switchRunningEngine(to type: EngineType) {
        if running.type == type {
            print("이미 \(type) 엔진으로 작동 중입니다.")
            return
        }
        
        switch type {
        case .electric:
            running = ElectricEngine()
        case .gasoline:
            running = GasolineEngine()
        case .hydrogen:
            print("가솔린 / 전기 엔진 중 하나로만 전환 가능합니다.")
        }
    }
}
```

(자동차의 실제 작동 원리는 모르지만)
작동 중인 엔진을 실질적으로 변경시키는 것은 `HybridCar`가 아닌 `HybridEngine`이라고 생각했기 때문에 본 클래스 내에서 `running`을 변경시키는 `func switchRunningEngine(to type:)`을 구현하였습니다.

**3️⃣HybridCar**

```swift
class HybridCar: Car {
    func switchEngine(to type: EngineType) {
        let hybridEngine = engine as! HydrogenEngine
        hybridEngine.switchRunningEngine(to: type)
    }
}
```

문제에서 요구한 `func switchEngine(to:)`는 위에서 언급했듯이 실질적인 동작은 엔진이 해야한다고 생각했으므로 `HybridEngine.switchRunningEngine(to:)`를 동작시키도록 구현하였습니다.

`Car` 클래스의 `engine` 변수는 `Engine`타입이므로 메소드를 사용하기 위해 `HydrogenEngine`으로 다운캐스팅 해주었습니다.

### 2) 제네릭 구조체
기존에는 구조체 자체에서 제네릭 타입에 프로토콜을 제한했습니다.

```swift
struct SortableBox<T: Comparable> {
    var items: [T]
    
    mutating func sortItems() {
        items.sort(by: <)
    }
}
```

그러나 위 방법은 `SortableBox` 인스턴스 생성 당시 제네릭 타입이 `Comparable` 프로토콜을 준수하고 있지 않으면 바로 오류가 발생하게 됩니다.

문제에서는 '타입 T가 `Comparable`을 준수할 때만 메서드 사용 가능', '`Comparable`을 따르지 않을 경우 `sortItems()` 호출 시 컴파일 오류 발생'이라는 조건을 제시합니다.

즉, 위 코드는 컴파일 오류 시점이 '생성 당시'이므로 문제의 '호출 시'와는 상이합니다.

튜터님의 조언으로 where 조건을 사용하여 해결되었습니다.

```swift
struct SortableBox<T> {
    var items: [T]
}

extension SortableBox where T: Comparable {
    mutating func sortItems() {
        items.sort(by: <)
    }
}
```

→ 타입 T가 `Comparable`을 준수하지 않으면 `sortItems()` 메소드는 보이지 않습니다.

위 패턴은 매우 다양하게 사용될 수 있으므로 꼭 기억해두겠습니다!

### 4) 순환 참조
**⚠️ 순환 참조 생성시 발견한 사소한(?) 오류**

```swift
var a: A?
var b: B?

a = A(name: "personA", home: nil)
b = B(name: "apartmentB", tenant: nil)

a?.home = b
b?.tenant = a

a = nil
b = nil
```
→ 의도한 대로 순환참조 발생

```swift
var a: A? = A(name: "personA", home: b)
var b: B? = B(name: "B", tenant: a)

a = nil
b = nil
```
→ `a`와 `b` 모두 메모리에서 해제됨

**🧐 둘다 동일한 방법으로 생성한 객체인데 왜 아래 방법은 메모리에서 해제되는가?**

➡︎ ❗️ 두 번째 방법은 애초에 잘못된 코드였어요!!

```swift
var a: A? = A(name: "personA", home: b)
```

→ `a`를 생성하는 시점에 `b`는 없습니다. 그래서 원래는 여기에서 오류가 나야하는데,, 탑레벨에서는 이유는 모르겠지만 오류가 나지않고 빌드가 됩니다... (함수에 넣어보면 오류가 발생합니다.)

이때 `a.home`을 찍어보면 `nil`값으로 출력됩니다.

즉, 애초에 `a`는 `b`를 참조하고 있지 않았던 것이죠.

다음으로 생성된 `b`에서는 `a`를 참조하지만 `a`가 `nil`값으로 먼저 해제되기 때문에 `a`와 `b` 사이에 순환 참조가 발생하지 않았던 것이었습니다.

실무에서는 이런 코드를 작성할 일 자체가 없을 것이라고 하셨지만.. 잘 살펴봐야겠습니다😵

**⚠️ 순환 참조 생성시 있었던 이상한 점..**

위에서 있었던 작은 해프닝을 뒤로 하고 클로저의 순환 참조를 만들고 있었는데 제대로 구현한 것 같은데 또 메모리에서 해제가 되었습니다.

```swift
var a: A?
var b: B?

func circularRef() {
    a = A(name: "personA", home: nil)
    b = B(name: "apartmentB", tenant: nil)
    
    a?.home = b
    b?.tenant = a
    
    b?.closure = { 
        print("\(a?.name)")
    }
}

circularRef()

a = nil
b = nil
```

위에서 언급한 오류를 피하기 위해 인스턴스 선언과 `nil` 할당 외에는 함수 내에서 구현하였는데, 순환 참조가 생성되지 않고 계속 메모리에서 해제되었습니다.

다만 `nil`할당을 없애고 코드 내에서 인스턴스를 선언 하였더니 순환 참조가 생성되었습니다.

```swift
func circularRef() {
    var a: A?
    var b: B?
    
    ...
    
}

circularRef()
```
→ 함수 내에서 인스턴스를 선언했기 때문에 함수의 실행이 종료되면 자동적으로 두 인스턴스가 사라집니다. 따라서 따로 `nil`값을 할당해줄 필요가 없습니다.

~~이렇게 해결하긴 했지만.. 튜터님 말씀으로는 탑레벨에서 인스턴스에 직접 `nil`값을 할당해줄 때 컴파일러 내부에서 ARC에 관한 동작이 우리가 생각하는 것과는 다르게 흘러가는 듯하다고 합니다.~~

⇒ 탑레벨에서 전역변수로 선언될 때는! `a`가 아니라 (예시)Global이라는 전역변수가 담긴 무언가를 참조한다고 합니다! (실제로는 어디에 담기는지는 모르겠지만) 그래서 `a` 인스턴스 자체에는 참조 카운트가 올라가지 않기 때문에 `a = nil`을 할당해주었을 때 메모리에서 해제가 된다고 합니다!!
