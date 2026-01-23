//
//  도전 문제 3.swift
//  ch.2
//
//  Created by 변예린 on 1/9/26.
//

import Foundation

extension Introducible {
    func introduce() -> String {
        return "안녕하세요, 저는 \(name)입니다."
    }
}

struct Test: Introducible {
    var name = "Test"
}

class Robot2: Introducible {
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
    
    init(name: String) {
        self.name = name
    }
    
    func introduce() -> String {
        return "삐빅- 저는 \(name)입니다."
    }
    
    // 고유 메서드
    func batteryCharge() {
        print("배터리 충전중...")
    }
}
