//
//  mission5.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/8/26.
//
enum DeliveryStatus {
    case notStarted
    case inTransit(daysRemaining: Int)
    case error
}

enum DeliveryError: Error {
    case invalidAddress
    case notStarted
    case systemError(reason: String)
}

func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String {
    if address == "" {
        throw DeliveryError.invalidAddress
    }
    switch status {
    case .notStarted:
        throw DeliveryError.notStarted
    case .error:
        throw DeliveryError.systemError(reason: "systemError")
    case .inTransit(daysRemaining: let days):
        return "배송까지 \(days)일이 남았습니다."
    }
}

