# Reduce

<img src = "https://user-images.githubusercontent.com/92699723/198066290-6f6bc93f-8098-4ea0-8f7d-53e0ad202559.png" width="500" height="300">

reduce 연산자의 요점은 시퀀스를 취한 다음 하나의 특정 값으로 줄이는 것입니다.

## 코드 전문
```Swift
let disposeBag = DisposeBag()

let source = Observable.of(1, 2, 3)

source.reduce(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)


source.reduce(0, accumulator: {
    summary, newValue in
    return summary + newValue
}).subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 6
// 6
```
reduece의 첫번째 인자(초기값)의 의미는 특정 지점이 어디에서 시작되고 있는지 확인하는 부분입니다. 또한 이 부분에 값을 추가하기 시작합니다.

둘 다 정확히 같은 일을 하고 있기 때문에 둘 다 똑같은 정확한 결과를 생성합니다.

(2코인)
실제로 무슨 일이 일어나고 있는지, 우리가 가지고 있는 summary와 newValue가 있는 특정 본문이 있기 때문에 이전 값에 1, 2, 3을 더할 것입니다.