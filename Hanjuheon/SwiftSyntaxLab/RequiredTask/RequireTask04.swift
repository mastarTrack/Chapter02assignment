//
//  RequireTask04.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

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

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - 배열변수에 forEach 함수 사용
*/
func Task04(){
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
    
    // 배열의 forEach문을 사용하여 실행하는 코드 추가
    introducible.forEach{
        switch $0{
        case let robot as Robot:
            robot.chargingBattary()
        case let cat as Cat:
            cat.knead()
        case let dog as Dog:
            dog.sit()
        default:
            print("특수 행동이 없습니다.")
        }
    }
}
