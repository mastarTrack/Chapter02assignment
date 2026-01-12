## CH 2. 프로그래밍 기초 주차 과제

### 필수문제 4) introducible 프로토콜을 준수하는 객체들을 타입 변환해서 사용하기
```swift
for i in introducibleArray {
    switch i {
    case is Cat:
        let cat = i as! Cat
        print(cat.meow())
        print(cat.introduce())
    case is Dog:
        let dog = i as! Dog
        print(dog.bark())
        print(dog.introduce())
    case is Robot:
        let robot = i as! Robot
        print(robot.charge())
        print(robot.introduce())
    default:
        print("해당없음")
    }
}
```
처음에는 단순하게 생각해서 해당 인스턴스에 접근해서 메서드를 쓰면 되겠다고 생각했다. 
하지만 저런 식으로 introducible 타입 Array에 넣으니 타입이 introducible이 되고 따로 타입을 정해주지 않고서는 해당 객체의 메서드를 사용하지 못했다. 그래서 is 와 as를 사용해서 타입 캐스팅을 해서 메서드에 접근할 수 있었다. 
