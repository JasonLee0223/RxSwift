# Combine Latest

<img src = "https://user-images.githubusercontent.com/92699723/198060417-2908c795-444e-459e-805f-328ffe216717.png" width="500" height="300">

CombineLater는 항상 두 시퀀스의 최신 값이 됩니다.

왼쪽 시퀀스에서 볼 수 있듯이 값은 1이고 오른쪽 시퀀스는 값이 4입니다.   
이들은 리더 값이지만 왼쪽은 1로 유지되고 오른쪽은 새 값을 얻습니다.   

그 후 왼쪽 시퀀스는 2라는 새로운 값을 얻고 오른쪽 시퀀스는 5와 같은 동일한 값을 설정합니다.

따라서 항상 왼쪽 및 오른쪽 시퀀스에서 오는 최신 값을 추적합니다.

## 코드 전문
```Swift
let left = PublishSubject<Int>()
let right = PublishSubject<Int>()

let observable = Observable.combineLatest(left, right, resultSelector: {
    lastLeft, lastRight in
    "\(lastLeft) \(lastRight)"
})

let disposable = observable.subscribe({ value in
    print(value)
})

left.onNext(45)
right.onNext(1)
left.onNext(30)
right.onNext(99)
right.onNext(2)

// Result
// next(45 1)
// next(30 1)
// next(30 99)
// next(30 2)
```
즉, CombinedLatest 연산자를 사용할 때 항상 왼쪽 및 오른쪽 시퀀스에서 최신 값을 가져옵니다.