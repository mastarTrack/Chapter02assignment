# [내배캠] Ch2. 프로그래밍 기초 주차 과제 풀이

## main.swift
문제에서 구현한 함수를 호출하는 파일입니다.

각 과제는 대부분 클래스로 구현된 경우를 제외하고 구조체로 작성되었습니다. 해당하는 구조체를 생성하여 함수를 호출합니다.

## 필수 문제
### 4)
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
### 1)
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
