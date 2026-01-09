//
//  도전 문제 4.swift
//  ch.2
//
//  Created by 변예린 on 1/9/26.
//

import Foundation

class A {
    let name: String
    var home: B?
    
    init(name: String, home: B?) {
        self.name = name
        self.home = home
    }
    
    deinit {
        print("\(name)가 메모리에서 해제되었습니다.")
    }
}

class B {
    let name: String
    weak var tenant: A? // var tenant: A? 로 작성 시 순환참조 발생
    var closure: (() -> Void)?
    
    init(name: String, tenant: A?) {
        self.name = name
        self.tenant = tenant
    }
    
    deinit {
        print("\(name)가 메모리에서 해제되었습니다.")
    }
}
