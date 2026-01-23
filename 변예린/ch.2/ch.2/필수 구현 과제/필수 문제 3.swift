//
//  필수 문제 3.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

struct Required3 {
    //    func a (_ arr: [Int]) -> [Int] {   << 기존 코드
    //        return arr.enumerated()
    //            .filter { $0.offset % 2 != 0) }
    //            .map { $0.element }
    //    }
    
    // Int 배열 짝수번째 요소 제거하여 반환
    //  - filter 조건 수정 : 조건을 좀더 명확히 보이게 하기 위해
    func a (_ arr: [Int]) -> [Int] {
        return arr.enumerated()
            .filter { !$0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    
    // String 배열 짝수번째 요소 제거하여 반환
    func b (_ arr: [String]) -> [String] {
        return arr.enumerated()
            .filter { !$0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    
    // 두 함수 a, b를 대체하는 함수
    func c<T> (_ arr: [T]) -> [T] {
        return arr.enumerated()
            .filter { !$0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    
    // Numeric 프로토콜을 준수하는 타입을 파라미터로 받는 함수
    // - 굳이 다른 타입 이름을 사용할 필요가 없어 T로 수정
    func d<T: Numeric> (_ arr: [T]) -> [T] {
        return arr.enumerated()
            .filter { !$0.offset.isMultiple(of: 2) }
            .map { $0.element }
    }
    
}
