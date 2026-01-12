//
//  challengeTask02.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 - [ ]  SortableBox 라는 이름의 제네릭 구조체를 정의해주세요.
 - 타입 파라미터는 1개이며, T 라는 이름으로 지정합니다.
 - [ ]  SortableBox 에 인스턴스 프로퍼티 `var items: [T]` 를 추가해주세요.
 - [ ]  타입 T 가 Comparable을 준수할 때에만 sortItems() 메서드를 사용할 수 있도록 구현하세요.
 - sortItems() 메서드는 items 배열을 오름차순으로 정렬합니다.
 - 정렬 결과는 items 프로퍼티에 반영되어야 합니다.
 - [ ]  T 가 Comparable 을 따르지 않는 타입일 경우, sortItems() 호출 시 컴파일 오류가 발생해야합니다.
 */

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
 - comparable규칙을 준수하는 신규 방식 추가
 - Comparable 규칙을 따르지않는 방식으로 사용시 에러나오는 코드 추가
 - 예시 코드 및 출력코드 추가
*/
func ChallengeTask02(){
    struct SortableBox_1<T: Comparable>{
        var items: [T]
        
        mutating func sortItem(){
            items.sort(by: >)
        }
    }
    
    struct SortableBox_2<T>{
        var items: [T]
        
        mutating func sortItem() where T: Comparable{
            items.sort(by: >)
        }
    }
    
    struct person{}
    
    var arr = [person(),person(),person()]
    var arrCom = [3,2,1,6,8,0]
    //var box = SortableBox_1(items: arr)
    var box = SortableBox_2(items: arrCom)
    print("정렬전: \(box)")
    box.sortItem()
    print("정렬전: \(box)")
}
