# Flat Map
이것은 Map Operator와 매우 유사합니다.   
flatMap은 관찰 가능한 값을 투영하고 관찰 가능한 값을 변환한 다음 대상 관찰 가능한 항목으로 이동합니다.

## 코드 전문
```Swift
struct Student {
    var score: BehaviorRelay<Int>
}
let disposeBag = DisposeBag()

let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

student.asObservable()
    .flatMap { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100)

student.onNext(mary)
mary.score.accept(80)

john.score.accept(43)

// Result
// 75
// 100
// 95
// 80
// 43
```

그 flatMap의 결과로 실제로 구독할 수 있으므로 구독이 시작되면 특정 점수만 받고 disposeBag로 처리할 수도 있습니다.

여러분은 이 특정 시간에 단순히 John의 값을 출력한다는 것을 알게 될 것입니다. 왜냐하면 행동을 사용하는 초기 값인 75가 있기 때문입니다.

이제 75개에서 100개를 얻을 수 있으므로 값이 변경될 때마다 실제로 구독이 시작됩니다.

여전히 해당 값을 추적하고 있으므로 Mary를 추적하고 있음을 알 수 있습니다.   
하지만 여전히 John에게 **`무슨 일이 일어나고 있는지 추적하고 있기 때문에 계속해서 이러한 모든 것을 추적하고 있으며, 이것이 Flatmap의 진정한 힘이라고 생각합니다.`**