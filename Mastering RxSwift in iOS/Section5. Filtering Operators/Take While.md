# Take While
takeWhile 연산자는 시퀀스에서 작동하므로 2 4와 3 값으로 구성된 특정 시퀀스가 있습니다.

이제 takeWhile 연산자를 수행하고 짝수 또는 완전히 2로 나누어 떨어지는 숫자만 선택하면 2와 4가 됩니다.

그리고 이것이 takeWhile 작동의 전체 목적이거나 이 조건이 실제로 takeWhile 본문을 통해 수행되는 동안 true이면 해당 항목을 계속 선택합니다.

특정 조건이 거짓이 되면 해당 조건을 찾는 것처럼 보이는 순서대로 항목이 있을지라도 더 이상 항목을 제공하지 않습니다.
하지만 그 조건이 깨졌다. 선택되지 않습니다.

<img src = "https://user-images.githubusercontent.com/92699723/197726010-e74a424b-dc11-4faf-a161-d35d672b73b2.png" width="500" height="300">

## 코드 전문
```Swift
let disposeBag = DisposeBag()

Observable.of(2, 4, 6, 7, 8, 10)
    .take { return $0 % 2 == 0 }
    .subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

// Result
// 2
// 4
// 6
```
2,4,6이 아닌 8과 10도 나눌 수 있고 이 특정 조건을 찾습니다.

그러나 7이 이 모든 상황에 중간에 있기 때문에 실제로 반환되지 않습니다.

기본적으로 여기에 7을 전달하면 나머지는 0과 같지 않고 연산은 거기에서 끝나며 시퀀스도 마찬가지입니다.