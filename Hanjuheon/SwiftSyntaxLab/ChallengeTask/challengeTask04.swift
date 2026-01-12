//
//  challengeTask04.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

/*
 - [ ]  클래스 A, B 사이에 순환참조가 발생하도록 구현해주세요.
     - 각 클래스에 `deinit` 을 정의하여, 메모리 해제 여부를 확인할 수 있도록 해주세요.
 - [ ]  또한 클래스 B 에는 `closure: (() -> Void)?` 프로퍼티를 만들고, 클로저 내부에서 `A`의 인스턴스를 참조하게 하여 클로저 기반의 순환 참조도 발생시켜보세요.
 - [ ]  순환 참조를 해결할 수 있도록 weak, unowned 키워드를 클로저 캡처 리스트를 적절히 사용하여 순환 참조를 해결해주세요.
 */

// 수정사항
/* 2026.01.12 한주헌
 - 별도의 폴더 및 파일로 과제 분리 및 관리 진행
*/
// 생성자 및 소멸자 확인
func ChallengeTask04(){
    
    // 생성자 및 소멸자 확인하기 위해 코드 작성
    var a:A? = A(name: "Gang",age: "00", address: "Seoul",education: nil)  // RC:0
    var b:B? = B(schoolName: "Seoul", major: "Software", information: nil) // RC:0
    a = nil
    b = nil
    
    print(" ------ ")
    
    // 순환참조 진행
    func testARC(){
        var c:A? = A(name: "Gang",age: "00", address: "Seoul",education: nil) //C RC:0
        var d:B? = B(schoolName: "Seoul", major: "Software", information: nil)//D RC:0
        c?.education = d  // RC:1
        d?.information = c// RC:1
        
        // 클로저 기반 순환참조
        
        /*
         # 순환참조가 아닌 이유
         클로저에 할당된 d는 외부 참조값으로 할당된것이기에 d = nil 진행하면 참조값이 사라지며 클로져로 인한 순환참조가 이루어 지지않는다.
         */
        d?.closure = { print("이름: \(d!.information!.name)")}
        d?.closure?()
        
        // 클로저 순환참조 진행
        d?.setClosure()
        
        c?.education = nil
        d?.information = nil
        
        c = nil  // C RC: 1 -> 메로리 해제 안됨
        d = nil  // D RC: 1 ->  메로리 해제 안됨
    }
    
    testARC()
    
    // ------ weak 키워드 사용
    print("\n --- weak --- ")
    
    var aa:C? = C(name: "Gang",age: "00", address: "Seoul",education: nil)
    var bb:D? = D(schoolName: "Seoul", major: "Software", information: nil)
    
    aa?.education = bb
    bb?.information = aa
    
    // 클로저 기반 순환참조
    bb?.setClosure()
    
    aa?.education = nil
    bb?.information = nil
    aa = nil
    bb = nil
}
