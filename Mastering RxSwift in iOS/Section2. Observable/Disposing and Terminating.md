# Disposing and Terminating

우리는 `Subscription disposing`에 대해 이야기한 적이 없습니다.   
`subscription`을 생성하면 `subscriber`가 반환되며 해당 구독자는 항상 특정 시퀀스를 듣거나 관찰할 것입니다.   

따라서 우리는 이러한 `subscribers`를 처리해야 합니다.   
해당 `subscriber`를 지원하지 않으면 메모리 누수가 발생할 수 있습니다.

## dispose()
이제 그 특정 `subscription`을 폐기하고 싶다면 간단히 `subscription.dispose()`라고 말할 수 있습니다.
```Swift
let subscription4 = observable4.subscribe(onNext: { element in 
    print(element)
})
subscription4.dispose()
```

그러면 `subscription`이 성공적으로 완료되어 실제로 메모리 누수가 발생하지 않을 것입니다.

그래서 우리는 사람들이 dispose를 호출하는 방법을 잊어버리거나 다른 작업을 하고 있는데 제대로 처리하지 않을 때   
이러한 `subscriptions'를 삭제하고 dispose를 호출하는지 확인해야 합니다.   
따라서 다른 폐기 방법이 있습니다.   

## DisposeBag()
```Swift
let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)
```
이 'disposeBag'는 특정 옵저버블을 처리하는 주요 역할을 하므로 'disposebag'이라는 클래스 중 하나를 사용할 것입니다.   

구독을 생성한 후 응답을 다시 전달하여 삭제된 함수를 사용하기만 하면 됩니다.   

이제 시간이 되면 실제로 disposeBag를 전달하기 때문에 이것이 적절하게 처리된다는 것을 알게 될 것입니다.   

따라서 이 특정 관찰 가능 항목이 완료되는 시점을 추적할 것입니다.   
적절하게 폐기할 수 있습니다.   

## Create Function
이제 구독을 생성할 수 있는 subscribe 메서드를 이미 보았지만 구독을 만드는 데 사용할 수 있는 또 다른 함수가 있습니다.   

그리고 그 함수를 생성 함수(create function)라고 합니다.   
이제 create 함수를 사용하여 유사한 구독을 만드는 방법을 살펴보겠습니다.   
```Swift
Observable<String>.create{ observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")
    return Disposables.create()
}
```
나는 우리가 string의 구독을 생성하고 있으며 create 함수를 사용할 것이라고 말할 것입니다.   

create 함수는 `Observable`을 제공할 것이며 이제 생성자의 본문에 대해 `completed` 및 `dispose`에 대한 모든 기능과 같은 일부 기능을 실제로 정의할 수 있습니다.   

또한 'Disposables'을 반환해야 합니다.   
따라서 Observable의 `create 기능을 사용할 때` `Disposable`으로 설정해야 하기 때문입니다.   

이 관찰 'observable'을 생성하면 구독할 수 있습니다.
```Swift
Observable<String>.create{ observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?")        // 출력되지않고 완료된 내용만 print
    return Disposables.create()
}.subscribe(onNext: { print($0) }, onError: { print($0) },
            onCompleted: { print("Completed") },
            onDisposed: { print("Disposed") } )
.disposed(by: disposeBag)

// Result
// A         -> .onNext("A")
// Completed -> .onCompleted()
// Disposed  -> onDisposed: { print("Disposed")}
```
따라서 해당 관찰을 완료하거나 완료로 표시한 후 다음 이벤트는 완료되었기 때문에 실제로 호출되지 않습니다.

## 마무리..
이제 'disposebags'와 메모리 관리 및 올바르게 `dispose`하는 방법에 대한 아이디어를 얻었습니다.   