# Publish Subjects

Subject를 통해 subscribe를 할 수 있고 이벤트를 내보낼 수도 있습니다.

시작하는 데 기본값이 필요하지 않습니다.   
그렇기 때문에 원래 초기값인 완전히 비어 있음을 알 수 있습니다.   
```Swift
let subject = PublishSubject<String>()
```

이제 이 특정 주제는 문자열 유형의 이벤트만 방출할 수 있으므로 이 경우 이벤트를 생성하거나 일부 이벤트를 렌더링할 수 있습니다.

```Swift
let subject = PublishSubject<String>()

subject.onNext("Issue 1")
```
예를들어 우리는 잡지에서 일하고 있었고 모든 사람에게 1호가 출시되었다고 말하고 있습니다.   

자, 만약 당신이 이것에 있다면, 아무 일도 일어나지 않을 것입니다. 그리고 그 이유는 구독자가 없기 때문입니다.  
마치 내가 잡지 회사를 가지고 있는 것과 같습니다.   

그리고 제가 새로운 호를 발행한다면, 글쎄요,  
그 특정 잡지에 대한 구독자가 없기 때문에 아무 일도 일어나지 않을 것입니다.   
이제 구독을 생성해 보겠습니다.   

```Swift
subject.subscribe { event in 
    print(event)
}
```
이제 이것을 실행하면 구독이 호출되는 것을 실제로 볼 수 없습니다.

그 이유는 구독이 호출되는 이벤트가 표시되지 않기 때문입니다.

우리는 실제로 이벤트를 생성하거나 이벤트를 렌더링하거나 기본적으로 이벤트를 트리거한 후 구독을 생성했습니다.

```Swift
subject.onNext(""Issue 2)
```
그러나 이 시점 이후에 또 다른 이슈인 issue2를 생성하면 생성되거나 기본적으로 구독한 후 모든 구독자에게 메시지를 보내는 것을 염두에 두고 이벤트가 실제로 진행되고 있음을 알 수 있습니다. .

---

그리고 우리가 구독한 후에 발생할 다른 모든 이벤트는 구독자가 사용할 수 있습니다.

그리고 이것은 현실 세계에서도 마찬가지입니다. 특정 잡지를 구독하고 있고 해당 잡지가 'issue5'에 있지만 'issue6' 시점에 발행 번호를 구독하는 경우에도 분명히 작동하는 방식입니다.

그러면 `issue1~5`를 얻지 못할 것입니다.

구독할 때 문제가 발생합니다.

```Swift
let disposeBag = DisposeBag()

let subject = PublishSubject<String>()

subject.onNext("Issue 1")

subject.subscribe{ event in
    print(event)
}

subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.dispose()

subject.onNext("Issue 4")
```
<img src = "https://user-images.githubusercontent.com/92699723/197015719-6208da3f-6732-47a1-bcb9-5e23c9c5c80e.png" width="500" height="500">   

'게시된 주제'에 대해 이해해야 할 또 다른 사항은 일단 진행하고 처분하고 처분한 후,

계속해서 issue4와 같은 이러한 종류의 이벤트를 추가로 생성하면 이러한 종류의 문제 이벤트는 무시됩니다.
```Swift
subject.onNext("Issue 2")
subject.onNext("Issue 3")

//        subject.dispose()
subject.onCompleted()

// Result
// next(Issue 2)
// next(Issue 3)
// completed
```
내가 그것을 dispose 및 completed 이벤트라고 부르는 경우는 어떻습니까?   
이 경우 17번 라인을 모두 극적으로 `dispose`하기 때문에 이 보드는 완전히 무시했습니다.   
이미 disposer 이벤트에서 우리 호출을 완료되지 않은 것으로 표시할 수 없다고 생각하고 있습니다.   

**`이것이 'PublishSubjects'가 작동하는 방식입니다.`**

```Swift
subject.onNext("Issue 2")
subject.onNext("Issue 3")

subject.dispose()
subject.onCompleted()

// Result
// next(Issue 2)
// next(Issue 3)
```

## 마무리..
`Subjects`는 매우 특별하다는 것을 항상 기억하십시오.   
그것은 `Values`을 방출할 수 있고 또한 `observe`할 수 있는 것이기 때문입니다.

따라서 기본적으로 '구독자'가 있고 그들은 '관찰자'이기도 합니다.