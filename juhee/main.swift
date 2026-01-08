//
//  main.swift
//  juhee
//
//  Created by 김주희 on 1/6/26.
//

import Foundation

//과제 1 풀이

let sum = { (a: Int, b: Int) -> String in
    return "두 수의 합은 \(a + b) 입니다."
    // 클로저 타입 명시하는법?
}

print(sum(10, 20)) // 두 수의 합은 30 입니다. 출력

func calculate(a: Int, b: Int, closure: (Int, Int) -> String) -> Void {
    print(closure(a, b))
}


// 과제 2 풀이

let numbers = [1, 2, 3, 4, 5]

var result = [String]()

result = numbers.map { String($0) }
print(result)


let numbers2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


// 체이닝 방식으로 수정
let result2 = numbers2.filter { $0 % 2 == 0} .map { String($0) }
print(result2)

func myMap (a: [Int], operation: (Int) -> String) -> [String] {
    var result = [String]()
    for i in a {
        result.append(operation(i)) // 파라미터로 받은 클로저 이용해서 변환
    }
    return result
}

let result4 = myMap(a: [1, 2, 3, 4, 5]) {
    String($0)
}

print(result4)
