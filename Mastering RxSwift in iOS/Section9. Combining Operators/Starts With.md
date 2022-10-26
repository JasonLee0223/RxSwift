# Starts With

<img src ="https://user-images.githubusercontent.com/92699723/198043146-c91cc7df-cbba-48a2-8673-67e65e7cc842.png" witdh="" height="">

하나를 가져와서 첫 번째 위치, 즉 startsWith 연산자를 추가하거나 이러한 startsWith 연산자를 수행하는 시퀀스의 시작 위치에 삽입했습니다.

```Swift
let disposeBag = DisposeBag()
        
let numbers = Observable.of(2, 3, 4)

let observable = numbers.startWith(1)
observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 1
// 2
// 3
// 4
```

startsWith는 특정 값을 시퀀스 시작에 삽입하는 특정 시퀀스에 특정 값을 전달할 때 startsWith가 해당 값을 삽입합니다.