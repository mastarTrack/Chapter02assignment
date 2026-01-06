//
//  필수 문제 2.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

struct Required2 {
    // for-in 반복문 map 변환
    let numbers = [1, 2, 3, 4, 5]
    lazy var result = numbers.map { String($0) }
    
    // 고차함수 체이닝
    func mapChain(_ arr: [Int]) -> [String] {
        return arr.filter { $0 % 2 == 0 }.map { String($0) }
    }
    
    // 고차함수 생성
    func myMap(_ arr: [Int], _ convert: (Int) -> String) -> [String] {
        var result: [String] = []
        
        for num in arr {
            result.append(convert(num))
        }
        
        return result
    }
}
