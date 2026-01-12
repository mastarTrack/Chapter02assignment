//
//  RequireTask03.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 # 필수 문제 1번
 
 - [ ]  Int 배열의 짝수번째 요소를 제거해서 반환하는 함수 `a` 를 작성해주세요.
 - 테스트 입력: [1, 2, 3, 4, 5]
 - 테스트 출력: [2, 4]
 - [ ]  String 배열의 짝수번째 요소를 제거해서 반환하는 함수 `b` 를 작성해주세요.
 - 테스트 입력: [”가”, “나”, “다”, “라”, “마”]
 - 테스트 출력: [”나”, “라”]
 - [ ]  위 두 함수를 하나의 함수로 대체할 수 있는 방법을 고민해보고, 함수 `c` 로 작성해주세요.
 - [ ]  테스트 입력들을 넣고 호출하여 출력이 제대로 나오는지 작성해주세요.
 - 테스트 입력: [1, 2, 3, 4, 5], [”가”, “나”, “다”, “라”, “마”]
 - 테스트 출력: [2, 4], [”나”, “라”]
 - [ ]  함수 `c` 를 기반으로 수정하여 함수 `d` 를 작성해주세요.
 - 파라미터의 타입을 << 'Numeric 프로토콜'을 준수하는 타입의 요소를 가진 배열 >> 로 변경합니다.
 */

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - 상세 동작방식을 주석으로 작성
*/
func Task03(){
    let arrInt: [Int] = [1,2,3,4,5]
    let arrStr: [String] = ["가","나","다","라","마"]
    var result:[Int] = []
    
    // 지정 데이터 타입 매개변수를 이용한 함수
    func removeIntArrEvenIndex(_ target: [Int])->[Int] {
        // # 반복문과 의문문을 이용한 문제 해결
        var result: [Int] = []
        for i in 0..<target.count{
            if i%2==1{
                result.append(target[i])
            }
        }
        print("반복문 및 의무문 조합 풀이: \(result)")
        return result
    }

    // # 고차 함수를 이용한 문제 해결 - 1
    result = arrInt.enumerated()    // enumerated함수로 키:밸류 튜플 배열로 변환 [[0,1],[1,2],[2,3],[3,4],[4,5]]
        .filter{ $0.offset%2==1 }   // filter 함수로 조건에 해당하는 값들만 추출 [[1,2],[3,4]]
        .map{$0.element}            // map 함수를 통해 밸류값만 배열로 묶음 [2,4]
    
    print("고차함수 풀이 1: \(result)")
    
    // # 고차 함수를 이용한 문제 해결 - 2
    result = arrInt.enumerated()            // enumerated함수로 키:밸류 튜플 배열로 변환 [[0,1],[1,2],[2,3],[3,4],[4,5]]
        .compactMap { (index, value) in     // compactMap 함수를 이용하여 조건에 해당하는 값들을 배열로 묶음 [2,4]
            index % 2 == 1 ? value : nil
        }
    
    print("고차함수 풀이 2: \(result)")
    
    
    // 제네릭을 이용하여 다양한 타입을 받아 처리할 수 있는 함수
    func removeEvenIndex<T>(_ target: [T])->[T]{
        return target.enumerated()
            .filter{ $0.offset%2==1 }
            .map{$0.element}
    }

    // 뉴머릭 제약 조건 추가 함수
    func removeEvenIndexAtNumeric<T: Numeric>(_ target: [T])->[T]{
        return target.enumerated()
            .filter{ $0.offset%2==1 }
            .map{$0.element}
    }

    // 결과값 출력
    print(removeEvenIndexAtNumeric(arrInt))
    print(removeEvenIndex(arrStr))
}
