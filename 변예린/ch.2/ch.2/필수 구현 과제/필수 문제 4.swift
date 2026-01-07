//
//  필수 문제 4.swift
//  ch.2
//
//  Created by 변예린 on 1/6/26.
//

import Foundation

// 프로토콜 정의
protocol Introducible {
    var name: String { get }
    
    func introduce() -> String
}

// Robot 타입 정의
struct Robot: Introducible {
    var name: String {
        didSet { // 변경될 때마다 변경 이전값, 이후값 출력
            if oldValue != name {
                print("""
                name 변경 알림
                변경 이전 값: \(oldValue)
                변경 이후 값: \(name)
                """)
            }
        }
    }
    
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
    
    // 고유 메서드
    func batteryCharge() {
        print("배터리 충전중...")
    }
}

// Cat 타입 정의
struct Cat: Introducible {
    var name: String
    
    func introduce() -> String {
        return "야옹, 저는 \(name)입니다."
    }
    
    // 고유 메서드
    func meow() {
        print("야옹")
    }
}

// Dog 타입 정의
struct Dog: Introducible {
    var name: String
    
    func introduce() -> String {
        return "멍멍! 저는 \(name)입니다."
    }
    
    // 고유 메서드
    func bark() {
        print("멍멍!")
    }
}

