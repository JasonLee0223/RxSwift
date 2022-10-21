# Replay Subjects
ReplaySubject는 기본적으로 설정하려는 버퍼 크기에 따라 이벤트를 재생합니다.   

```Swift
let subject = ReplaySubject<String>.create(bufferSize: 2)
```
이는 새 구독자가 이 주제를 구독하려고 할 때 해당 주제에서 내보낸 마지막 두 값을 자동으로 재생한다는 것을 의미합니다.   

Event를 아래와 같이 내보내고   
```Swift
subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")
```

subscribe를 통해 구독을 하도록 합니다.
```Swift
subject.subscribe { 
    print($0)
}

// Result
// next(Issue 2)
// next(Issue 3)
```
그럼 어떤 내용이 출력될 것 같나요?   
'issue1', 'issue2', 'issue3'의 이벤트가 모두 발생합니다.   
여기에 어떤 문제가 인쇄될까요?   

구독을 할 때, 해당 구독을 다시 재생하므로 두 가지 이벤트가 제공됩니다.   
 
우리는 실제로 `bufferSize`에 두 개를 전달했기 때문입니다.   

그러나 어떤 두 가지 사건이 있습니까?   
음, 마지막 두 이벤트를 진행하고 실행하면 issue2와 issue3이 표시됩니다.   

## 🔴 Issue 4, 5, 6를 추가하여 비교
```Swift
let disposeBag = DisposeBag()

let subject = ReplaySubject<String>.create(bufferSize: 2)

subject.onNext("Issue 1")
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.subscribe{
    print($0)
}

subject.onNext("Issue 4")
subject.onNext("Issue 5")
subject.onNext("Issue 6")

print("[Subscription 2]")
subject.subscribe{
    print($0)
}

// Result
// next(Issue 2)
// next(Issue 3)    -> subscribe { print($0) } 구문이 ReplaySubject의  실행 됨.BufferSize에 맞게
// next(Issue 4)
// next(Issue 5)
// next(Issue 6)    -> 여기까지 그대로 이벤트를 내보냄
// [Subscription 2]
// next(Issue 5)
// next(Issue 6)    -> 위와 마찬가지로 subscribe 구문이 ReplaySubject의 BufferSize에 맞게 마지막 이벤트 2개가 출력됨.
```
구독 번호 2가 방출된 마지막 두 이벤트를 가져오는 것을 보게 될 것입니다.   
그리고 이 경우 마지막 두 이벤트는 `issue5`와 `issue6`였습니다.   

따라서 버퍼 측면을 기반으로 재생하려는 경우 `ReplaySubject`가 좋습니다.
이는 새 구독자에 대해 마지막 두 이벤트가 재생됨을 의미합니다.