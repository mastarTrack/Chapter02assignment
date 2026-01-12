//
//  challengeMission4.swift
//  BasicAssignments
//
//  Created by Yeseul Jang on 1/9/26.
//

final class A {
    var b: B?

    deinit {
        print("🅰️ A deinit")
    }
}

final class B {
    weak var a: A? //약한 참조
    var closure: (() -> Void)?

    deinit {
        print("🅱️ B deinit")
    }
}

func makeMemoryLeak() {
    print("memory leak start")
    
    let a = A()
    let b = B()
    
    //참조순환
    a.b = b
    b.a = a

    //클로저 기반 순환참조
    b.closure =
    { [weak a] in
        guard let a else { return }
        print("b 클로저 안에서 a 참조하기: \(a)")
    }
    b.closure?()
    
    print("memory leak end")
}
