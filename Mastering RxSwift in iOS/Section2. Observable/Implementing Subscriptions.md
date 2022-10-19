# Implementing Subscriptions

## 🟢 Observable.subscribe Example
Observable4는 이 특정 관찰 가능 항목이 [1, 2, 3, 4, 5] 항목을 포함한다는 것을 의미합니다.   

따라서 전체 배열은 아니지만 배열의 항목이 포함되며 이것이 `from`, `of`와 어떻게 다른지 알 수 있습니다.   

다음 생성할 모든 'Observable'에 대한 함수, 즉 `subscribe`라고 합니다.   
`subscribe` 해당 Observable을 구독하면 이러한 값이나 옵저버블이 관찰하는 모든 것에 액세스할 수 있습니다.   

```Swift
let observable4 = Observable.from([1, 2, 3, 4, 5])

observable4.subscribe { event in
    print(event)
}

// Result
// next(1)
// next(2)
// next(3)
// next(4)
// next(5)
// completed
```
### 🤔 우리가 확인한 결과값은 정확히 무엇을 얻고 있습니까?   
따라서 우리는 이 숫자의 실제 값이나 배열의 내용이 무엇이든 실제로 얻지 못합니다.   
다음 이벤트인 이벤트를 가져오고 있으며 다음 이벤트에는 값이 포함되어 있습니다.   
**`그러나 문제는 우리가 어떻게 그 가치를 얻는가 하는 것입니다!`**   
**우리는 `event`보다 우리가 관찰하는 이러한 `value`에 더 관심이 있습니다.**   

- 그리고 앞서 배운 또 다른 사실은 `Observable`의 모든 값을 거친 후 마침내 완료 이벤트를 발생시키거나 완료 이벤트가 실제로 트리거된다는 것입니다.   

이제 이러한 실제 값을 얻는 방법을 살펴보겠습니다.   
따라서 배열에 개별 숫자가 포함되어 있기 때문에 각 개별 요소를 참조하는 element라는 속성이 있는 경우 하나, 둘, 셋, 넷, 다섯이 있습니다.   

```Swift
let observable4 = Observable.from([1, 2, 3, 4, 5])

observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

//Result
// 1
// 2
// 3
// 4
// 5

```

### from 대신에 off 메소드나 함수를 사용하여 생성된 코드는 어떤 일이 일어날까?
```Swift
let observable4 = Observable.from([1, 2, 3, 4, 5])
observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

let observable3 = Observable.of([1, 2, 3])

observable3.subscribe{ event in
    print(event)
}

// 1
// 2
// 3
// 4
// 5

// next([1, 2, 3])
// completed
```

observable4의 첫 번째 항목에서 우리는 이 모든 값을 잘 얻습니다.   

그러나 두 번째 항목에서는 `observable3`이 배열의 개별 요소가 아니라 전체 배열에 있는 것을 볼 수 있습니다.   

따라서 우리가 `observable3`에서 관찰하는 유일한 요소는 전체 배열입니다.   

이제 전체를 얻는 데 사용할 수 있는 것과 동일한 구문을 원하면 분명히 해당 배열을 얻을 수 있습니다. 그리고 개별 요소가 아닌 전체 배열인 요소를 인쇄할 수 있습니다.
```Swift
let observable3 = Observable.of([1, 2, 3])

observable3.subscribe{ event in
    if let element = event.element {
        print(element)
    }
}
// [1, 2, 3]
```
## `of`와 `from`의 차이
- 'of'는 전체 배열 또는 여기에서 전달하는 모든 항목에 대해 관찰 가능 항목을 만들려는 경우입니다.

- 그러나 'from' 배열을 전달하면 전체 배열이 아닌 배열의 개별 요소에 대해 관찰 가능한 항목이 생성됩니다.

### 👉🏻 좀 더 쉽게 array의 element에 접근하는 방법
이제 값을 언래핑하고 값에 액세스하는 이 패턴은 너무 일반적이어서 RxSwift가 값에 액세스하는 훨씬 쉬운 방법을 제공합니다.
```Swift
observable4.subscribe(onNext: { element in
    print(element)
})

// 1
// 2
// 3
// 4
// 5
```