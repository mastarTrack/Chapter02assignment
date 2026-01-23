//
//  필수 문제 1.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

struct Required1 {
    // 두 개의 Int값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저 설계
    let sum: (Int, Int) -> String = {
        return "두 수의 합은 \($0 + $1) 입니다."
    }
    
    // sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는 함수
    func calculate (_ num1: Int, _ num2: Int, _ operation: (Int, Int) -> String) {
        print(operation(num1, num2))
    }
}
