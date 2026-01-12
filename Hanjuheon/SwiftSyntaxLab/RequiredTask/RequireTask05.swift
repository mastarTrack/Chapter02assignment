//
//  RequireTask05.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 우리는 간단한 **택배 도착 예측 시스템**을 만들고 있다고 가정합니다.
 
 사용자에게 예상 도착일을 알려주려 하지만, 다음과 같은 여러 상황에서 문제가 발생할 수 있습니다:
 
 - 주소가 잘못된 경우
 - 배송이 아직 시작되지 않은 경우
 - 시스템 서버 에러로 예측이 불가능한 경우
 - [ ]  배송 상태를 표현하는 DeliveryStatus 열거형을 구현하고, 아래 3가지 상태를 포함하도록 합니다.
 - notStarted
 - inTransit(daysRemaining: Int)
 - error
 - [ ]  사용자 정의 에러 타입 DeliveryError를 Error 프로토콜을 따르도록 정의합니다.
 - invalidAddress
 - notStarted
 - systemError(reason: String)
 - [ ]  아래 시그니처를 가진 throwing function 을 구현해봅니다.
 
 ```swift
 func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String
 ```
 
 - 주소가 빈 문자열이면 DeliveryError.invalidAddress를 던져야 합니다.
 - 배송이 아직 시작되지 않은 경우 DeliveryError.notStarted를 던져야 합니다.
 - 시스템 에러 상태면 DeliveryError.systemError(reason:)을 던져야 합니다.
 - 나머지 경우에는 "배송까지 X일 남았습니다." 형태의 문자열을 반환합니다.
 - [ ]  위 함수를 do-catch 로 호출하고, 각 에러 상황에 따라 사용자에게 다른 메시지를 출력하세요.
 */

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - throw 키워드 삭제
 - 실행 코드 추가
*/
func Task05(){
    
    // DeliveryStatus 열거형 생성
    enum DeliveryStatus{
        case notStarted
        case inTransit(daysRemaining: Int)
        case error
    }
    
    // Error 열거형 생성
    enum DeliveryError: Error{
        case invalidAddress
        case notStarted
        case systemError(reason: String)
        
        
    }
    
    // 2026/01/09 refector
    // Switch 문으로 변환
    func predictDeliveryDay(for address: String, status: DeliveryStatus) throws -> String{
        
        guard !address.isEmpty else{
            throw DeliveryError.invalidAddress
        }
        
        switch status {
        case .notStarted:
            throw DeliveryError.notStarted
            
        case .error:
            throw DeliveryError.systemError(reason: "시스템 에러가 발생하였습니다")
            
        case .inTransit(let daysRemaining):
            return "배송까지 \(daysRemaining)일 남았습니다."
        }
    }
    
    
    // 2026/01/09 refector
    // 상위 함수랑 동일한 코드가 작성되어 있어 함수 호출로 변경
    // Do-Catch 문으로 변환
    // 2026/01/12 refector
    // throw 키워드 삭제
    func predictDeliveryDayAnDoCatch(for address: String, status: DeliveryStatus) -> String{
        do{
            let result = try predictDeliveryDay(for: address, status: .notStarted)
            return result
        }catch DeliveryError.invalidAddress{
            return "빈 주소값이 입력되었습니다. 확인 부탁드립니다."
        }catch DeliveryError.notStarted{
            return "아직 상품이 배송되지 않았습니다."
        }catch DeliveryError.systemError(let errorText){
            return errorText
        }catch{
            return ("\(error)")
        }
    }
    
    print(predictDeliveryDayAnDoCatch(for: "서울시", status: .inTransit(daysRemaining: 5)))
}
