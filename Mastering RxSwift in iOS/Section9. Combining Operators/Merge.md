# Merge

<img src = "https://user-images.githubusercontent.com/92699723/198046659-7e15c8ef-b5aa-4522-a780-dd7be6a631c7.png" width="500" height="300">

여기서 주목해야 할 중요한 점은 이러한 값이 관찰되는 시점(시간 순서)이 다르다는 것입니다.

왼쪽 시퀀스와 오른쪽 시퀀스에서 하나를 얻습니다.(1번을 얻음)   
그 다음에는 4번, 5번을 얻은 다음 왼쪽 시퀀스로 전환하여 2번, 오른쪽 시퀀스, 6번, 왼쪽 3번을 줄 것입니다.

따라서 왼쪽 및 오른쪽 시퀀스에 대해 merge 연산자를 수행하면 두 시퀀스의 값을 포함하지만 특정 순서가 아닌 완전히 새로운 시퀀스를 얻게 됩니다.

**`merge 연산자에 대해 결정되는 순서는 특정 값이 병합 중인 특정 시퀀스에 도달하는 지점입니다.`**   
**`concat 연산자처럼 결합하지 않습니다. 값(value)의 도착 시점에 따라 병합합니다.`**

```Swift
let disposeBag = DisposeBag()
        
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let source = Observable.of(left.asObservable(), right.asObservable())
let observable = source.merge()

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

left.onNext(5)
left.onNext(3)
right.onNext(2)
right.onNext(1)
left.onNext(99)

// Result
// 5
// 3
// 2
// 1
// 99
```
`source.merge()`에 있는 것은 실제로 값을 게시할 때 이 두 주제의 결과를 캡처하고 있습니다.

즉, 좌변과 우변의 결과가 도착하자마자 합치는 것입니다.