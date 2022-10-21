# Variables
`Variable`은 BehaviorSubject를 수신하고 해당 값을 상태에 저장하고 value 속성을 사용하여 값에 액세스할 수 있습니다.   

이제 BehaviorSubject를 사용하기 때문에 일종의 초기 값을 변수에 전달해야 합니다.   

```Swift
let variable = Variable("Initial Value")

variable.value = "Hello World"
variable.asObservable()
    .subscribe {
        print($0)
    }
```

원하는 경우 실제로 값을 변경할 수 있습니다. 값 속성이 문자열임을 알 수 있습니다.   

그것이 내가 초기 값을 제공하기 위해 여기에서 사용한 것이기 때문입니다.   

주목해야 할 또 다른 중요한 사항은 이 경고가 더 이상 사용되지 않는다는 것입니다.   
`Variable`은 향후 지원 중단될 예정이며 behaviorRelay를 사용하여 대체될 예정입니다.   

## Variable (X) -> BehaviorRelay로 대체
참고사이트: [RxSwift property  observe (BehaviorRelay,  Variable)](https://myseong.tistory.com/11)   
