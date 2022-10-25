# Filter
이제 필터 연산자를 수행하면 실제로 해당 특정 시퀀스의 값이 3보다 작은 값만 필터링되는 방식으로 필터링하여 기본적으로 사용자에게 제공되면 어떤 결과가 나올까?

<img src="https://user-images.githubusercontent.com/92699723/197688428-8c1fdec4-3d1e-4852-9235-8f80fa51993d.png" width="500" height="300">

두 개의 값만 실제로 3보다 작기 때문에 두 개의 값만 얻게 됩니다.   
즉, 하나와 둘로 구성된 시퀀스로 끝날 것이라는 의미입니다.   

## 코드 전문
```Swift
let disposeBag = DisposeBag()

Observable.of(1, 2, 3, 4, 5, 6, 7)
    .filter { $0 % 2 == 0}.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 2
// 4
// 6
```