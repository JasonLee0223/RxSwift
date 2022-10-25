# Take Until
take 연산자의 또 다른 변형은 skipUntil 연산자와 매우 유사한 takeUntil 연산자입니다.

<img src="https://user-images.githubusercontent.com/92699723/197727681-d6647cb0-ac34-4945-8cd2-8eb67a98a001.png" width="500" height="300">

## 코드 전문
```Swift
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.take(until: trigger).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

subject.onNext("1")
subject.onNext("2")

trigger.onNext("X")

subject.onNext("3")

// Result
// 1
// 2
```

`Trigger`이후 1과 2에 이외는 아무 것도 표시되지 않았음에도 알 수 있습니다.

이 경우 3인 것은 `takeUntil` 연산자 때문에 완전히 무시되었습니다. 이 연산자는 `Trigger`가 충족되고 그 후에는 모든 값을 완전히 무시합니다.