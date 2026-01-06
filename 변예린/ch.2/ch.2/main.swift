//
//  main.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

let answer = Answer.shared

//MARK: 필수 문제

// 1.
// - sum 호출 코드
print(answer.required1.sum(3, 5))

// - calculate 호출 코드
answer.required1.calculate(3, 5, answer.required1.sum)


// 2.
// - myMap 호출 코드
print(answer.required2.myMap([1, 2, 3]) { String($0) })


// 3.
// - 함수 a 호출 코드
print(answer.required3.a([1, 2, 3, 4, 5]))

// - 함수 b 호출 코드
print(answer.required3.b(["가", "나", "다", "라", "마"]))

// - 함수 c 호출 코드
print(answer.required3.c([1, 2, 3, 4, 5]))
print(answer.required3.c(["가", "나", "다", "라", "마"]))

// - 함수 d 호출 코드
// print(answer.required3.d(["가"]))  // 오류
print(answer.required3.d([1, 2, 3, 4, 5]))


