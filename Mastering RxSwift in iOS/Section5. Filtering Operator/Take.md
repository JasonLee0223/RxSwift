# Take
우리는 특정 시퀀스에서 두 개의 항목을 가져올 것입니다.

따라서 우리의 경우 하나, 둘, 셋의 세 가지 항목이 있으므로 두 개 작업을 수행하면 두 개의 항목이 됩니다.

<img src="https://user-images.githubusercontent.com/92699723/197725040-c5c19522-8fb0-4bba-b6b5-e9655ea7012a.png" width="500" height="300">

## 코드 전문
```Swift
let disposeBag = DisposeBag()

Observable.of(1, 2, 3, 4, 5, 6).take(3).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 1
// 2
// 3
```