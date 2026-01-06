//
//  main.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/6/26.
//

import Foundation

// 필수 문제 1--------------------------------------------------------------------------

//두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
// {(num1: Int, num2: Int) -> String in return "두 수의 합은 \(num1 + num2) 입니다"}


// 이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요
let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다" }


//sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
print(sum(1,3))


//위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
func calculate(num1: Int, num2: Int, _ sum: (Int, Int) -> String) {
    print(sum(num1, num2))
}

calculate(sum, num1: 5, num2: 25)





// 필수 문제 2------------------------------------------------------------------------

//아래 for-in 문을 map 을 사용하는 코드로 변환해주세요.
let numbers = [1, 2, 3, 4, 5]
var result = [String]()

result = numbers.map { "\($0)" }

print(result)



//주어진 입력값을 고차함수를 체이닝하여 주어진 출력값이 나오도록 구현해주세요.
let oneToTen = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let resultArr = oneToTen.filter { $0 % 2 == 0 }.map { "\($0)" }

print(resultArr)



//이제 고차함수를 직접 만들어 봅니다.
func myMap(_ IntArr: [Int], _ change: (Int) -> String) -> [String] {
    var result: [String] = []
    for num in IntArr {
        result.append(change(num))
    }
    return result
}

let newArr = myMap([1, 2, 3, 4, 5]) { String($0) }
print(newArr)


// 필수 문제 3---------------------------------------------------------------------------

// Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 a 를 작성해주세요.

