# Element At -> element(at:)
특정 시퀀스에 대한 elementAt 연산자와 인수로 하나를 경로로 지정하면 특정 값과 특정 인덱스를 제공할 것입니다.   
이 경우에는 2가 됩니다.   
<img src = "https://user-images.githubusercontent.com/92699723/197687237-0b0f760a-92d4-47d0-9b6e-c468d47b43ea.png" width="500" height="300">

## 코드 전문
```Swift
let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.element(at: 2).subscribe(onNext: { _ in
    print("You are out!")
}).disposed(by: disposeBag)

strikes.onNext("X")     // index0
strikes.onNext("X")     // index1
strikes.onNext("X")     // index2

// Result
// You are out!
```

## 결론
구독이 결코 실행되지 않는다는 것을 다시 보게 될 것입니다.   
우리는 실제로 그것을 호출하고 있습니다.   
우리는 elementAt index2를 원합니다.   
이는 인덱스가 실제로 0 인덱스에서 시작하기 때문에 한 번 더 해야 한다는 것을 의미합니다.