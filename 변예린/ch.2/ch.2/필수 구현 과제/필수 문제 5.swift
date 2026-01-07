//
//  필수 문제 5.swift
//  ch.2
//
//  Created by 변예린 on 1/7/26.
//

import Foundation

struct Required5 {
    
    var remainingDay: Int = 3 // 함수를 위한 임의 변수 정의
    
    // 요구 throwing function
    func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
        
        // 주소가 잘못된 경우
        if address.isEmpty {
            throw DeliveryError.invalidAddress
        }
        
        // DeliveryStatus에 따른 분기 처리
        switch status {
        case .notStarted: // 배송이 아직 시작되지 않은 경우
            throw DeliveryError.notstarted
            
        case .error: // 시스템 서버 에러로 예측이 불가능한 경우
            throw DeliveryError.systemError(reason: "서버 에러")
            
        case .inTransit(dayRemaining: let day): // 정상 배송 상태
            return "배송까지 \(day)일 남았습니다."
        }
    }
}

// 배송 상태 열거형
enum DeliveryStatus {
    case notStarted
    case inTransit(dayRemaining: Int)
    case error
}

// 에러 타입 열거형
enum DeliveryError: Error {
    case invalidAddress
    case notstarted
    case systemError(reason: String)
}
