# Behavior Subjects

이는 `BehaviorSubjects`가 초기화하기 위해 초기 값을 전달해야 한다는 점이 `PublishedSubjects`와 한 가지의 차이점이 있지만 매우 유사합니다.

그리고 초기 값을 전달해야 하는 이유는 구독할 때 모든 값 또는 초기 값 또는 마지막 값을 제공하기 때문입니다.

```Swift
let subject = BehaviorSubject(value: "Initial Value")
```
`BehaviorSubject`에 사용할 수 있는 유일한 생성자 또는 그 중 하나가 실제로 일종의 초기 값을 받는 것을 볼 수 있습니다.

```Swift
let subject = BehaviorSubject(value: "Initial Value")
subject.subscribe { event in 
    print(event)
}

// Result
// next(Initial Value)
```
내가 받을 이벤트는 실제로 초기 값에 대한 마지막 값과 함께 실제로 있었던 마지막 값을 포함합니다.

초기 값이 포함된 해당 이벤트를 실제로 출력하는 것을 볼 수 있습니다.

```Swift
subject.subscribe { event in 
    print(event)
}
subject.onNext("Issue 1")

// Result
// next(Initial Value)
// next(Issue 1)
```
초기 값이 출력되는 것을 볼 수 있지만 다음에는 실제로 issue1이 출력됩니다.   
이벤트는 해당 특정 `BehaviorSubject`의 마지막 값을 가리킵니다.   

```Swift
subject.onNext("Last Issue")

subject.subscribe { event in 
    print(event)
}
//subject.onNext("Issue 1")

// Result
// next(Last Issue)
```
`subject.onNext("Issue 1")를 `subject.onNext("Last Issue")`로 변경하면   
결과는 `Last Issue`가 됩니다.   

왜냐하면 우리는 처음에 초기 값으로 작업했지만 그 특정 BehaviorSubject에서 방출된 `Last Value`는 `Last Issue`였고 이것이 인쇄된 이유입니다.

### Total Code
<img src = "https://user-images.githubusercontent.com/92699723/197027561-c5e03a51-ac53-4ec7-a583-5439dd1486bd.png" width="500" height="500" >

## 마무리
그래서 BehaviorSubjects가 실제로 작동하는 방식은 PublishedSubject와 매우 유사하지만 한 가지 차이점은 방출해야 하거나 사용 가능한 마지막 값을 자동으로 방출한다는 것입니다.