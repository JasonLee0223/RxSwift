# Concat

<img src = "https://user-images.githubusercontent.com/92699723/198045051-4a846b59-601a-48c9-bdb1-cec153e84032.png" width="500" height="300">

RxSwift에서 Concat 연산자를 사용하여 첫 번째 시퀀스와 두 번째 시퀀스를 연결하면 첫 번째 시퀀스와 두 번째 시퀀스의 값을 모두 포함하는 새 시퀀스를 얻게 됩니다.

마치 두 시퀀스를 함께 결합하는 것과 같으며 최종 시퀀스에는 두 시퀀스의 값이 모두 포함됩니다.

## 코드 전문
```Swift
let disposeBag = DisposeBag()
        
let first = Observable.of(1, 2, 3)
let second = Observable.of(4, 5, 6)

let observable = Observable.concat([first, second])

observable.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 1
// 2
// 3
// 4
// 5
// 6
```