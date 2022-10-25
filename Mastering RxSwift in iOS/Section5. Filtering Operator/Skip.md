# Skip
그들이 건너뛰기 연산자를 수행하고 skip(2)이라고 말하면   
1과 2를 완전히 건너뛰고 마지막 값 이 경우 3을 얻습니다.   

<img src = "https://user-images.githubusercontent.com/92699723/197692050-668217bf-678b-43f2-a8f5-c663bd270e35.png" width="500" height="300">

## 코드 전문
```Swift
let disposeBag = DisposeBag()

Observable.of("A", "B", "C", "D", "E", "F")
    .skip(3).subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// Result
// D
// E
// F
```