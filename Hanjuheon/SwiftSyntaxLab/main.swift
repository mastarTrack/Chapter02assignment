//
//  main.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/6/26.
//

import Foundation

/*
 # 필수 문제 1번
 
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

print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 01\n")

let test: (Int, Int) -> Int = { value1, value2 in
    return value1 + value2
}

// 인트형 파라매터 2개를 받고 문자열을 반환하는 클로져 생성
let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다." }

// 클로저 호출
let result01 = sum(3,5)


// 클로저를 매개변수로 받는 함수
func calculate(_ a:Int, _ b: Int, _ sum: (Int,Int) -> String) -> Void {
    print(sum(a,b))
}

// 제작한 sum 클로져를 매게변수로 사용
calculate(5, 5, sum)

// 트레일러클로저를 생성하여 매개변수로 사용
calculate(3,5){ "두 수의 합은 \($0 + $1) 입니다."}

print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 02\n")
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
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
 ```
 */


var numbers = [1, 2, 3, 4, 5]

// for문을 고차함수 map을 이용하여 변경
var result02 = numbers.map{"\($0)"}
print("필수 문제 2 - 1 결과값 출력")
print(result02)

// 다음 문제 풀이를 위해 요소 추가
numbers.append(contentsOf: [6,7,8,9,10])

// 배열에서 짝수 값을 추출하여 문자로 변환하는 함수 선언
func ChangeArrIntToArrStr (_ arrayInt: [Int])->[String] {
    return arrayInt.filter {$0%2==0}.map{"\($0)"}
}

// 함수호출
result02 = ChangeArrIntToArrStr(numbers)

// 결과값 출력
print("필수 문제 2 - 2 결과값 출력")
print(result02)

func CustomMap(_ arrInt: [Int], _ changeClosure: ((Int)->String)) ->[String]{
    var mapResult: [String] = []
    for intValue in arrInt{
        mapResult.append(changeClosure(intValue))
    }
    return mapResult
}

result02 = CustomMap([1,2,3,4,5]){"\($0)"}
print("필수 문제 2 - 3 결과값 출력")
print(result02)

print("\n\n ----------------------------------------- \n\n")
print("# 필수문제 풀이 03")
// ----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
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


let arrInt: [Int] = [1,2,3,4,5]
let arrStr: [String] = ["가","나","다","라","마"]

// 지정 데이터 타입 매개변수를 이용한 함수
func removeIntArrEvenIndex(_ target: [Int])->[Int] {
    // # 반복문과 의문문을 이용한 문제 해결
    var result: [Int] = []
    for i in 0...target.count-1{
        if i%2==1{
            result.append(target[i])
        }
    }
    print("반복문 및 의무문 조합 풀이: \(result)")
    
    // # 고차 함수를 이용한 문제 해결 - 1
    result = target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
    print("고차함수 풀이 1: \(result)")
    
    // # 고차 함수를 이용한 문제 해결 - 1
    result = target.enumerated()
        .compactMap { (index, value) in
            index % 2 == 1 ? value : nil
        }
    print("고차함수 풀이 2: \(result)")
    
    return result
}

// 제네릭을 이용하여 다양한 타입을 받아 처리할 수 있는 함수
func removeEvenIndex<T>(_ target: [T])->[T]{
    return target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
    
}

// 뉴머릭 제약 조건 추가 함수
func removeEvenIndexAtNumeric<T: Numeric>(_ target: [T])->[T]{
    return target.enumerated()
        .filter{ $0.offset%2==1 }
        .map{$0.element}
}


print(removeEvenIndexAtNumeric(arrInt))
print(removeEvenIndex(arrStr))


print("\n\n -----------------------------------------")
print("\n# 필수문제 풀이 04\n")
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

protocol Introducible{
    var name:String {get set}
    func introduce() -> String
}

struct Robot: Introducible{
    var name: String{
        didSet{
            guard oldValue != name else {return}
            print("변경 이후 값:\(name)")
        }
        willSet{
            guard newValue != name else {return}
            print("name 변경 알림\n변경 이전 값:\(name)")
        }
    }
    func introduce()-> String{
        return  "안녕하세요, 저는 \(name)입니다."
    }
    
    func chargingBattary(){
        print("\(name)이(가) 배터리를 충전합니다.")
    }
}

struct Dog: Introducible{
    var name: String
    func introduce()-> String{
        return  "안녕하세요, 저는 \(name)입니다."
    }
    func sit(){
        print("\(name)이(가) 제자리에 앉았습니다.")
    }
}

struct Cat: Introducible{
    var name: String
    func introduce()-> String{
        return  "안녕하세요, 저는 \(name)입니다."
    }
    func knead(){
        print("\(name)이(가) 꾹꾹이를 해줍니다.")
    }
}

var robot:Robot = Robot(name: "태권브이")
let dog:Dog = Dog(name: "백구")
let cat:Cat = Cat(name: "나비")

robot.name = "마징가"
print("")

let introducible:[Introducible] = [robot,dog,cat]

for intro in introducible{
    switch intro{
    case is Robot:
        guard let robots = intro as? Robot else{ continue }
        robots.chargingBattary()
    case is Dog:
        
        guard let robots = intro as? Dog else{ continue }
        robots.sit()
    case is Cat:
        
        guard let robots = intro as? Cat else{ continue }
        robots.knead()
    default:
        print("특수 행동이 없습니다.")
    }
}
