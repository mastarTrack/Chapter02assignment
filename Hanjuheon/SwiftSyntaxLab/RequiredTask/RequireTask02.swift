//
//  RequireTask02.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//


/*
 # 필수 문제 1번

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

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - String.init을 통한 형변환 방식 추가
 - isMultiple 함수를 이용한 배수 조건 방법 추가
*/
func Task02(){
    var numbers = [1, 2, 3, 4, 5]

    // for문을 고차함수 map을 이용하여 변경
    var result02 = numbers.map{"\($0)"}
    // String.init 함수를 이용해 변환 방법 추가
    result02 = numbers.map(String.init)
    
    print("필수 문제 2 - 1 결과값 출력")
    print(result02)

    // 다음 문제 풀이를 위해 요소 추가
    numbers.append(contentsOf: [6,7,8,9,10])

    // 배열에서 짝수 값을 추출하여 문자로 변환하는 함수 선언
    func changeArrIntToArrStr (_ arrayInt: [Int])->[String] {
        return arrayInt
            .filter{$0%2==0}
            .map{"\($0)"}
    }
    
    // isMultiple 함수를 통한 배수 조건 추가
    func changeArrIntToArrStrNew (_ arrayInt: [Int])->[String] {
        return arrayInt
            .filter{$0.isMultiple(of: 2)}
            .map(String.init)
    }

    // 함수호출
    result02 = changeArrIntToArrStrNew(numbers)

    // 결과값 출력
    print("필수 문제 2 - 2 결과값 출력")
    print(result02)

    func customMap(_ arrInt: [Int], _ changeClosure: ((Int)->String)) ->[String]{
        var mapResult: [String] = []
        for intValue in arrInt{
            mapResult.append(changeClosure(intValue))
        }
        return mapResult
    }

    result02 = customMap([1,2,3,4,5]){"\($0)"}
    print("필수 문제 2 - 3 결과값 출력")
    print(result02)
    
}
