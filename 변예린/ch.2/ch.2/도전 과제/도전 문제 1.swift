//
//  도전 문제 1.swift
//  ch.2
//
//  Created by 변예린 on 1/8/26.
//

import Foundation

//MARK: 자동차 정의
// Car 클래스 설계
class Car {
    let brand: String
    let model: String
    let modelYear: String
    let engine: Engine
    
    init(brand: String, model: String, modelYear: String, engine: Engine) {
        self.brand = brand
        self.model = model
        self.modelYear = modelYear
        self.engine = engine
    }
    
    // 접근 제어자와 함께 동작 정의
    public func drive() {
        print("[\(brand) \(model)] 주행 중...")
    }
    
    public func stop() {
        print("[\(brand) \(model)] 정지")
    }
    
    public func park() {
        print("[\(brand) \(model)] 주차")
    }
}

// Car를 상속한 ElectricCar 설계
class ElectricCar: Car {
    // ElectricEngine 타입의 Engine 사용
    init(brand: String, model: String, modelYear: String) {
        super.init(brand: brand, model: model, modelYear: modelYear, engine: ElectricEngine())
    }
}

// Car를 상속한 HybridCar 설계
class HybridCar: Car {
    // HydrogenEngine 타입의 Engine 사용
    init(brand: String, model: String, modelYear: String) {
        super.init(brand: brand, model: model, modelYear: modelYear, engine: HydrogenEngine())
    }
    
    func switchEngine(to type: EngineType) {
        let hybridEngine = engine as! HydrogenEngine
        hybridEngine.switchRunningEngine(to: type)
    }
}

//MARK: 엔진 정의
// 엔진 열거형 타입 정의 - switch 기능의 편리성을 위해
enum EngineType {
    case electric, gasoline, hydrogen
}

// Engine 커스텀 타입 정의
class Engine {
    var type: EngineType
    
    init(_ type: EngineType) {
        self.type = type
    }
}

// Electric Engine 타입 정의
class ElectricEngine: Engine {
    init() {
        super.init(.electric)
    }
}

// Gasolin Engine 타입 정의
class GasolineEngine: Engine {
    init() {
        super.init(.gasoline)
    }
}

// HydrogenEngine 정의
class HydrogenEngine: Engine {
    // 현재 작동 중인 엔진
    private var running: Engine = GasolineEngine() {
        didSet {
            print("현재 작동 중인 엔진이 \(oldValue.type)에서 \(running.type)으로 변경되었습니다.")
        }
    }
    
    init() {
        super.init(.hydrogen)
    }
    
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

