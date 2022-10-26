# Flat Map Latest

```Swift
let disposeBag = DisposeBag()
        
let john = Student(score: BehaviorRelay(value: 75))
let mary = Student(score: BehaviorRelay(value: 95))

let student = PublishSubject<Student>()

student.asObservable()
    .flatMapLatest { $0.score.asObservable() }
    .subscribe(onNext: {
        print($0)
    }).disposed(by: disposeBag)

student.onNext(john)
john.score.accept(100)

student.onNext(mary)
john.score.accept(45)
```

이제 John의 점수를 변경하면 이제 John을 완전히 무시한다는 것을 알 수 있습니다.

그것은 출력 창에 무언가를 쓰지 않는데, 그 이유는 이 특정 순간에 Mary만 관찰하고 이것이 FlatMap이 작동하는 방식이기 때문입니다.

그것은 마지막 또는 가장 최근의 관찰 가능한 것만 관찰하고 기록이 관찰 가능한 것이 아니라 가장 최근의 것을 확인하지 않는 것입니다.

그래서 때로는 FlatMap을 원하고 때로는 조건에 따라 FlatMapLatest를 사용하고 싶을 때가 있습니다.