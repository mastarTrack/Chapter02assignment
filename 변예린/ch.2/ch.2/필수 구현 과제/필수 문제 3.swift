//
//  필수 문제 3.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

struct Required3 {
    // Int 배열 짝수번째 요소 제거하여 반환
    func a (_ arr: [Int]) -> [Int] {
        return arr.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }
    
    // String 배열 짝수번째 요소 제거하여 반환
    func b (_ arr: [String]) -> [String] {
        return arr.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }
    
    // 두 함수 a, b를 대체하는 함수
    func c<T> (_ arr: [T]) -> [T] {
        return arr.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }
    
    // Numeric 프로토콜을 준수하는 타입을 파라미터로 받는 함수
    func d<D: Numeric> (_ arr: [D]) -> [D] {
        return arr.enumerated()
            .filter { $0.offset % 2 != 0 }
            .map { $0.element }
    }    
}
