# Skip Until
skipUntil 연산자는 트리거를 기다릴 것입니다.

따라서 기본적으로 트리거를 받으면 해당 특정 트리거 이후의 모든 값이 통과합니다.

따라서 SkipUntil을 호출하고 트리거를 전달하면 값 1 다음에 트리거가 호출됩니다.

따라서 최종 시퀀스의 일부가 될 값은 트리거가 발생한 후에 오는 값이 되며 이 경우에는 겨우 2와 3입니다.

<img src="https://user-images.githubusercontent.com/92699723/197694573-b10e1886-a638-4b37-8a76-02ea0034aff2.png" width="500" height="300">

## 코드 전문
```Swift
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()
let trigger = PublishSubject<String>()

subject.skip(until: trigger).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

subject.onNext("A")
subject.onNext("B")

trigger.onNext("X")

subject.onNext("C")

// Result
// C
```

## 결론
출력 C를 생성하는 것을 볼 수 있습니다.

C는 Subject 또는 특정 시퀀스입니다.   
그 특정 값은 그 전에 행 번호 17(trigger.onNext("X"))을 `trigger`라고 부르기 때문입니다.

그리고 `trigger`를 호출하면 기본적으로 흐름이 시작됩니다.

따라서 이 경우 `trigger.onNext`에 `trigger`를 제공하면 `trigger`를 기다리고 있기 때문에 A와 B는 완전히 무시됩니다.

`trigger`를 제공하면 `subject`에 대한 모든 값이 다시 흐르기 시작합니다.