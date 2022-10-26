# Map

<img src="https://user-images.githubusercontent.com/92699723/197946780-68abeeb8-1a5e-487a-b2fa-f9e97e8969e2.png" width="500" height="300">

고차함수와 동일하게 각 element를 돌아서 특정 시퀀스에 대해 수행한 결과값을 출력해낸다.

## 코드 전문
```Swift
let disposeBag = DisposeBag()
        
Observable.of(1,2,3,4,5)
    .map{
        return $0 * 2
    }.subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

// Result
// 2
// 4
// 6
// 8
// 10
```