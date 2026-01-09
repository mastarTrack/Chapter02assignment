//
//  challengeMission1 - 2.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/9/26.
//

//protocol과 struct 이용해보기
protocol EngineProtocol {
    var type: EngineType { get }
}

struct ElectricEngineS: EngineProtocol {
    let type: EngineType = .electric
}

struct HydrogenEngineS: EngineProtocol {
    let type: EngineType = .hydrogen
}

protocol EngineSwitchableCar: CarProtocol {
    var engine: any EngineProtocol { get set }
    mutating func switchEngine(to newEngine: any EngineProtocol)
}

extension EngineSwitchableCar {
    mutating func switchEngine(to newEngine: any EngineProtocol) {
        engine = newEngine
        print("\(newEngine.type)엔진으로 교체")
    }
}

protocol CarProtocol {
    var brand: String { get }
    var model: String { get }
    var year: String { get }
    var engine: any EngineProtocol { get }
    
    func drive()
    func stop()
}

extension CarProtocol {
    func drive() {
        print("🚗 운전중입니다.")
    }
    
    func stop() {
        print("🛑 정지합니다.")
    }
}

struct ElectricCarS: CarProtocol {
    let brand: String
    let model: String
    let year: String
    let engine: any EngineProtocol
    
    init(brand: String, model: String, year: String) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = ElectricEngineS()
    }
}

struct HybridCarS: EngineSwitchableCar {
    let brand: String
    let model: String
    let year: String
    var engine: any EngineProtocol
    
    init(brand: String, model: String, year: String) {
        self.brand = brand
        self.model = model
        self.year = year
        self.engine = HydrogenEngineS()
    }
}

/*
 //상속을 사용하여 기능을 추가하는 것과, 프로토콜 채택을 통해서 기능을 추가하는 것의 장단점, 차이를 고민하고 주석으로 서술해주세요.
 요구사항 정리:
 - Car 타입 안에는 파라미터 brand, model, year, engine와 메서드 drive, stop 존재
 - 전기차는 전기 엔진만을 가짐(못바꿈)
 - 하이브리드차만 엔진 교체 가능(switchEngine(to:)
 
 class 상속이용 시:
 장점 - Car안에 메서드 drive, stop가 있고 상속 시 자식들이 사용가능하다는게 직관적이다.
 단점 - 엔진을 바꿀 수 없다는 제한은 접근제어와 init을 이용해야만 한다.
       한 클래스에 여러 기능을 넣기에는 상속은 복잡할거 같다.
 
 protocol 채택이용 시:
 장점 - 여러 기능을 붙이기 좋다.
 단점 - 지금과 같이 any EngineProtocol타입인데 특정 인스턴스만 갖도록 설정하려면
       기능이 다르기때문에 새 protocol을 만들거나 associatedtype를 사용하게 되는데
       그러면 해당 엔진 타입 때문에 차가 CarProtocol타입이 안되어서 나중에 활용이 어렵다.
      
 
 결론: class는 상태,값을 공유해야하거나 구현한 걸 재사용할 때 직관적이고 좋은거 같음
      특정 타입이 어떤 기능만 가졌으면 좋겠다 싶으면 protocol이 좋은 거같다.
 */
