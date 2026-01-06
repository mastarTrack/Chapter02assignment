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
