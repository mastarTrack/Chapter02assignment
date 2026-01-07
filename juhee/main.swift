//
//  main.swift
//  juhee
//
//  Created by 김주희 on 1/6/26.
//

import Foundation

// 과제 1 풀이

var sum: (Int, Int) -> String = { a, b in
    return "두 수의 합은 \(a + b) 입니다."
}

sum(10, 20)
print(sum) // 두 수의 합은 30 입니다. 출력

func calculate(a: Int, b: Int, closure: (Int, Int) -> String) -> Void {
    closure(a, b)
}
