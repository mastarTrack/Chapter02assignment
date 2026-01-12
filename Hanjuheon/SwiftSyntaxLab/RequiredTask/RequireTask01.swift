//
//  RequireTask01.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 # 필수 문제 1번
 
 - [ ]  두 개의 Int 값을 파라미터로 받고, 하나의 String 값을 반환하는 클로저를 설계해주세요.
 - 클로저 내부에서는 두 정수를 더한 후, "두 수의 합은 {합계} 입니다"라는 문자열을 반환합니다.
 - [ ]  이 클로저를 상수 sum에 저장하고, 정확한 타입을 명시해주세요.
 
 ```swift
 var num: Int = 3
 ```
 
 - [ ]  sum을 호출하는 코드를 작성해주세요. (파라미터로 전달하는 값은 임의로 선택)
 - [ ]  위에서 정의한 sum과 동일한 타입의 클로저를 파라미터로 받고, 반환 값이 없는(void) 함수 calculate를 작성해주세요.
 1. (조건) calculate 함수 구현 내에서는 파라미터로 전달받은 클로저를 호출하는 코드를 포함해야합니다.
 */


// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - 문제조건 중 클로저만 파라미터로 받는 함수 추가 생성
*/
func Task01(){
    // 인트형 파라매터 2개를 받고 문자열을 반환하는 클로져 생성
    let sum: (Int, Int) -> String = { "두 수의 합은 \($0 + $1) 입니다." }

    // 클로저 호출
    let result01 = sum(3,5)
    print(result01)
    
    // sum과 동일한 클로저를 파라미터로 받는 함수 생성
    func calculate(_ sum:(Int,Int) -> String){
        print(sum(3,5))
    }
    
    // sum 클로저를 매개변수로 사용
    calculate(sum)

    // 클로저를 매개변수로 받는 함수
    func calculateToGetNumber(_ a:Int, _ b: Int, _ sum: (Int,Int) -> String) -> Void {
        print(sum(a,b))
    }
    // 제작한 sum 클로져를 매게변수로 사용
    calculateToGetNumber(5, 5, sum)
    
    // 트레일러클로저를 생성하여 매개변수로 사용
    calculateToGetNumber(3,5){ "두 수의 합은 \($0 + $1) 입니다."}
}

