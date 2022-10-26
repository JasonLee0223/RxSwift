# Ignore
세 가지 다른 값 1, 2 및 3으로 구성된 시퀀스가 있고   
해당 특정 시퀀스에 대해 요소, 기능 또는 요소 무시 연산자를 수행하고 무시하면 빈도가 발생하게 됩니다.

<img src="https://user-images.githubusercontent.com/92699723/197686158-34cf1dc3-71be-41ea-bb71-aab98d1849ec.png" width="500" height="300">

모든 요소를 무시합니다.   
이제 한 가지 명심해야 할 점은 요소가 무시되지만 완료된 이벤트가 실제로 트리거된다는 것입니다.   

## 코드 전문
```Swift
let strikes = PublishSubject<String>()

let disposeBag = DisposeBag()

strikes.ignoreElements().subscribe { _ in
    print("[Subscription is called]")
}.disposed(by: disposeBag)

strikes.onNext("A")
strikes.onNext("B")
strikes.onNext("C")

strikes.onCompleted()

// Result
// [Subscription is called]
```

## 결론
따라서 ignoreElements 연산자는 실제 요소에 대해 별로 신경 쓰지 않지만 특정 시퀀스가 실제로 관찰일 때 구독을 시작하고 싶을 때 유용합니다.