# Scan

<img src = "https://user-images.githubusercontent.com/92699723/198068908-32ca2d1d-5f18-4dbc-b061-93c6b74a3f84.png" width="500" height="300">

이것은 reduce 연산자의 가까운 사촌입니다.   
그리고 이러한 값에 대해 Scan 연산자를 수행할 것입니다. 이는 Reduce 연산자와 매우 유사합니다.

그리고 한 가지만 다른 reduce 연산자와 매우 유사합니다.

실제로 업데이트된 값을 누계로 제공하므로 값과 Summary의 원래 값 사이에 추가 연산을 수행할 때 사용 중일 때 대신 1, 3, 6이 표시됨을 알 수 있습니다.   
reduce 연산자를 사용하면 최종 값만 얻었습니다.

따라서 Scan 연산자를 사용하면 제공하는 스캔 본문을 기반으로 조건에 따라 값을 스캔할 수 있습니다.

## 코드 전문
```Swift
let disposeBag = DisposeBag()
        
let source = Observable.of(1, 2, 3, 5, 6)

source.scan(0, accumulator: +)
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// Result
// 1
// 3    1 + 2
// 6    1 + 2 + 3
// 11   1 + 2 + 3 + 5
// 17   1 + 2 + 3 + 5 + 6 
```