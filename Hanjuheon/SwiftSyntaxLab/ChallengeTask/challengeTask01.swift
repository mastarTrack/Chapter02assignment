//
//  challengeTask01.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

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

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - 클래스 상속을 이용한 엔진 클래스 생성
 */
func ChallengeTask01(){
    
    // --------------------------------------------
    
    // 엔진 프로토콜 생성
    protocol EngineProtocol{
        var engineName: String { get }
        var engineTurnOnOff: Bool {get set}
        mutating func turnOnOffengine(_ onOff:Bool)->Void
        func checkEngine()->Bool
    }
    
    // 기름 엔진 구조체 생성
    class OilEngine: EngineProtocol {
        let engineName: String = "가솔린 엔진"
        var engineTurnOnOff: Bool = false
        
        func turnOnOffengine(_ onOff: Bool)->Void {
            engineTurnOnOff = onOff
            
            if onOff {
                print("터보 엔진을 켰습니다.")
            } else {
                print("터보 엔진을 껐습니다.")
            }
        }
        func checkEngine()->Bool{
            return engineTurnOnOff
        }
    }
    
    // 전기차 엔진 구조체 생성
    class ElectricEngine: EngineProtocol{
        let engineName: String = "전기모터 엔진"
        var engineTurnOnOff: Bool = false
        func turnOnOffengine(_ onOff: Bool)->Void {
            engineTurnOnOff = onOff
            
            if onOff {
                print("전기모터를 켰습니다.")
            } else {
                print("전기모터를 껐습니다.")
            }
        }
        func checkEngine()->Bool{
            return engineTurnOnOff
        }
    }
    
    // 하이브리트차 엔진 구조체 생성
    class HydrogenEngine: EngineProtocol{
        let engineName: String = "수소 엔진"
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
    
    // --------------------------------------------
    // 클래스 상속을 이용한 엔진 생성
    class EngineClass{
        let engineName: String
        var engineTurnOnOff: Bool = false
        
        init(engineName: String){
            self.engineName = engineName
        }
        
        func turnOnOffengine(_ onOff: Bool)->Void {
            engineTurnOnOff = onOff
            
            if onOff {
                print("터보 엔진을 켰습니다.")
            } else {
                print("터보 엔진을 껐습니다.")
            }
        }
        func checkEngine()->Bool{
            return engineTurnOnOff
        }
    }
    // 전기엔진 함수선언
    class electricEngineClass: EngineClass{
        override func turnOnOffengine(_ onOff: Bool) {
            engineTurnOnOff = onOff
            
            if onOff {
                print("전기 모터를 켰습니다.")
            } else {
                print("전기 모터를 껐습니다.")
            }
        }
    }
    
    // 하이브리드 엔진 함수선언
    class HydrogenEngineClass: EngineClass{
        override func turnOnOffengine(_ onOff: Bool) {
            engineTurnOnOff = onOff
            
            if onOff {
                print("전기 모터를 켰습니다.")
            } else {
                print("전기 모터를 껐습니다.")
            }
        }
    }
    
    
    // 자동차 클래스 정의
    class car {
        internal var brand: String
        internal var model: String
        internal var modelYear: String
        private var fuelGagage: Int
        internal var engine: EngineProtocol
        
        init(model:String,
             brand:String,
             modelYear:String,
             oilGagage:Int,
             engine:EngineProtocol){
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
        
        fileprivate func getEngineModel(){
            print("엔진 종류: \(engine.engineName)")
        }
        
        internal func turnOnOffEngine(){
            engine.turnOnOffengine(true)
        }
    }
    
    //전기차 정의
    class electricCar: car{ }
    
    // 하이브리드 차 정의
    class hybridCar: car{
        func switchEngine(to setEngine: EngineProtocol) {
            self.engine = setEngine
        }
    }
    
    var myCar:hybridCar = hybridCar(model: "투싼", brand: "현대", modelYear: "2021", oilGagage: 80, engine: HydrogenEngine())
    myCar.getEngineModel()
    myCar.switchEngine(to: ElectricEngine())
    myCar.getEngineModel()
    
    /*
     클래스 상속의 장단점
     장점: 부모의 프로퍼티와 메소드를 그대로 재사용할 수 있다,
     단점: 단일상속만 가능하다. 클래스만 상속이 가능하다.
     
     프로토콜 채택의 장단점
     장점: 클래스 외에도 struct, enum등 유연하게 사용가능하며, 다중채택이 가능하다.
     단점: 프로토콜을 채택할때마다 선언된 프로퍼티와 메소드를 초기화 및 구현을 해줘야한다.
     */
}
