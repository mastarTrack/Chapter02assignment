//
//  challengeTask03.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 필수문제 4 구현에서 연속된 문제입니다.

 - [ ]  Introducible 프로토콜을 채택하는 타입들에게 **기본 introduce() 동작**을 제공하세요.
     - 각 타입들이 introduce() 를 구현하지 않고도  introduce() 를 호출할 수 있어야합니다.
 - [ ]  Robot, Cat, Dog 타입을 정의하고 Introducible 프로토콜을 채택해주세요.
     - 이 때, Robot 타입은  **기본 introduce() 동작** 이 아닌 커스텀 동작을 하도록 구현해주세요.
 */
import Foundation

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
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

func ChallengeTask03(){

    var robot: Robot = Robot(name: "마징가")
    print(robot.introduce())

    
    print("\n\n -----------------------------------------")
    print("\n# 도전문제 풀이 04\n")
}
