# Swift 기초 과제 정리

Swift 기본 문법을 연습하면서 작성한 과제 풀이 코드입니다.  
클로저, 고차함수, 제네릭, 프로토콜, 에러 처리까지 직접 구현해봤습니다.

---

## 📁 프로젝트 구성

- `main.swift`  
  Playground / Command Line Tool 환경에서 실행 가능한 단일 파일

---

## ✅ 과제 1: 클로저 (Closure)

- `(Int, Int) -> String` 타입의 클로저 정의
- 클로저를 파라미터로 받아 호출하는 함수 구현

---

## ✅ 과제 2: 고차함수 (map / filter)

- `map`으로 타입 변환
- `filter` + `map` 체이닝
- 클로저를 받아 동작하는 커스텀 `map` 구현

---

## ✅ 과제 3: 제네릭 (Generic)

- Int / String 배열에서 동일한 로직을 타입별로 구현
- 제네릭으로 공통 로직 통합
- `Numeric` 제약을 걸어 특정 타입만 받도록 처리

---

## ✅ 과제 4: 프로토콜 & 타입 캐스팅

### Introducible 프로토콜

- `name` 프로퍼티 (읽기 전용)
- `introduce()` 메서드 요구

### 구현 타입

- `Robot / Cat / Dog`

### 확인한 내용

- 프로토콜 타입 배열에 담으면 프로토콜에 정의된 멤버만 접근 가능
- 구체 타입의 기능은 다운캐스팅 후 사용 가능

---

## ✅ 과제 5: 에러 처리 (throws)

- enum + associated value로 에러 케이스 정의
- throwing 함수 구현
- do–try–catch로 상황별 분기 처리

---

## 🚀 도전 과제 2: 제네릭 제약 + 조건부 메서드

- `SortableBox<T>` 제네릭 구조체 구현 (`items: [T]`)
- `T: Comparable`일 때만 `sortItems()`가 보이도록 확장
- Comparable이 아닌 타입은 `sortItems()` 호출 시 컴파일 오류로 막히는 것 확인

---

## 🚀 도전 과제 3: 프로토콜 기본 구현

- `Introducible` extension에서 기본 `introduce()` 제공
- `Cat`, `Dog`는 `introduce()` 구현 없이 기본 동작 사용
- `Robot`은 기본 동작 대신 커스텀 `introduce()` 구현

---

## ▶️ 실행 방법

- Xcode Playground 또는 Command Line Tool 프로젝트에서  
  `main.swift` 실행

---

## 🙋‍♀️ 작성자

- 김주희  
- 내일배움캠프 iOS 9기 `🤓왜_되는지_증명못함` 팀
