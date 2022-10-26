# With Latest From

<img src = "https://user-images.githubusercontent.com/92699723/198064548-9e47e740-364a-4527-8132-8051c71c8582.png" width="500" height="300">

WithLatestFrom 연산자는 기본적으로 특정 시퀀스 또는 특정 컨트롤에서 최신 값을 가져올 수 있습니다.

따라서 텍스트 파일이나 버튼을 누르고 텍스트 필드에서 최신 정보를 얻으려면 최신 정보와 함께 사용할 수 있으며 버튼을 클릭하면 항상 텍스트 파일에서 최신 값을 얻을 수 있습니다.   
이 경우 파리입니다.

따라서 텍스트 필드가 이러한 이벤트를 생성하더라도 입력할 때마다 withLatestFrom을 호출하면 해당 시점의 값만 얻게 됩니다.

## 코드 전문
```Swift
let disposeBag = DisposeBag()
        
let button = PublishSubject<Void>()
let textField = PublishSubject<String>()

let observable = button.withLatestFrom(textField)
let disposable = observable.subscribe(onNext: {
    print($0)
})

textField.onNext("Sw")
textField.onNext("Swif")
textField.onNext("Swift")
textField.onNext("Swift Rocks!")

button.onNext(())
button.onNext(())

// Result
// Swift Rocks!
// Swift Rocks!
```
이것이 전체 요점입니다.
`withLatestFrom`은 버튼을 클릭하거나 이 경우 일종의 트리거가 발생합니다.   
그리고 해당 트리거는 다른 관찰에서 최신 값을 가져옵니다.   
이 경우에는 텍스트 필드 값입니다.