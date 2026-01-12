//
//  Untitled.swift
//  SwiftSyntaxLab
//
//  Created by Hanjuheon on 1/12/26.
//

class A {
    var name: String = "HonGilDong"
    var age: String = "999"
    var address: String = "Seoul"
    var education: B?
    
    init(
        name: String,
        age: String,
        address: String,
        education: B?
    ){
        print("인적정보 생성자 실행")
        self.name = name
        self.age = age
        self.address = address
        self.education = education
    }
    
    deinit{
        print("인적정보 소멸자 실행")
    }
}

class B {
    var schoolName: String = "Seoul Uni."
    var major: String = "Software"
    var information: A?
    var closure: (() -> Void)?
    
    init(
        schoolName: String,
        major: String,
        information: A?
    )
    {
        print("학력정보 생성자 실행")
        self.schoolName = schoolName
        self.major = major
        self.information = information
    }
    deinit{
        print("학력정보 소멸자 실행")
    }
}


// weak 키워드 사용
class C{
    var name: String = "HonGilDong"
    var age: String = "999"
    var address: String = "Seoul"
    weak var education: D?
    
    init(
        name: String,
        age: String,
        address: String,
        education: D?
    ){
        print("weak 인적정보 생성자 실행")
        self.name = name
        self.age = age
        self.address = address
        self.education = education
    }
    
    deinit{
        print("weak 인적정보 소멸자 실행")
    }
}

class D {
    var schoolName: String = "Seoul Uni."
    var major: String = "Software"
    weak var information: C?
    var closure: (() -> Void)?
    
    init(
        schoolName: String,
        major: String,
        information: C?
    )
    {
        print("weak 학력정보 생성자 실행")
        self.schoolName = schoolName
        self.major = major
        self.information = information
    }
    deinit{
        print("weak 학력정보 소멸자 실행")
    }
}
