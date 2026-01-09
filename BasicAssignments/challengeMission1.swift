//
//  challengeMission1.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/9/26.
//

// Engine 이라는 커스텀 타입으로 정의해주세요.
enum EngineType {
    case electric
    case hydrogen
}

class Engine {
    let type: EngineType
    
    init(type: EngineType) {
        self.type = type
    }
}

final class ElectricEngine: Engine {
    init() {
        super.init(type: .electric)
    }
}

final class HydrogenEngine: Engine {
    init() {
        super.init( type: .hydrogen)
    }
}


// Base Class Car 를 설계해주세요.
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
    
    func drive() {
        print("🚗 운전중입니다.")
    }
    
    func stop() {
        print("🛑 정지합니다.")
    }
}

class ElectricCar: Car {
    init(brand: String, model: String, year: String) {
        super.init(brand: brand, model: model, year: year, engine: ElectricEngine())
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

