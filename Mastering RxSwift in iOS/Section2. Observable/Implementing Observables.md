# Implementing Observables

옵저버블을 생성하려면 옵저버블 클래스를 사용해야한다.   
옵저버블 클래스에는 옵저버블을 생성할 수 있는 다양한 기능이 많이 포함되어 있습니다.   

## 🟢 Observable.just
```Swift
let observable = Observable.just(1)
```
`Observable.just`는 옵저버블을 만들 것입니다.   
이 경우에는 하나의 특정 요소, 즉 1번만 사용하면 됩니다.   

이제 이것을 실행하려고 하면 실제로 아무 일도 일어나지 않는 것을 보게 될 것이다.
즉, 우리는 관찰 가능 항목을 만들었지만 관찰 가능 항목을 실제로 구독하지는 않습니다.

## 🟢 Observable.of
```Swift
// Declaration
// let observable2: Observable(Int)
let observable2 = Observable.of(1, 2, 3)
```
`Observable.of` 함수를 사용하면 배열 또는 다른 요소로 관찰 가능 항목을 만들 수 있습니다.   
또는 실제로 `1, 2, 3`을 전달할 수 있도록 다른 요소 집합입니다.   

이것은 기본적으로 변수 매개변수라고 하며 기본적으로 여기에 여러 값을 전달할 수 있습니다.   
따라서 이 옵저버블을 구독하면 이 숫자 `1, 2, 3`을 하나씩 얻게 됩니다.   
 
 ```Swift
 // Declaration
 //let observable3: Observable([Int])
 let observable3 = Observable.of([1, 2, 3])
 ```
이 경우, 당신은 또한 요소를 전달할 것이고 나는 '1, 2, 3'이 있는 배열을 전달할 것입니다.

이 Observable은 정수 배열에서 생성됩니다.
개별 정수 또는 int 값이 아니라 이 특정 관찰 가능한 숫자 3이 정수 배열에서 작동할 것입니다.
따라서 이 배열은 이 특정 관찰 가능한 값입니다.

## 🟢 Observable.from
```Swift
// Declaration
// let observable4: Obsevable<Int>
let observable4 = Observable.from([1, 2, 3, 4, 5])
```
이 경우 `Observable.from`을 사용할 것입니다.   
실제로 배열을 취하는 것을 볼 수 있으며 원하는 경우 배열을 전달할 수 있습니다.   
**따라서 'of'와 매우 다릅니다.**   
**`of`는 옵저버블이 배열에서 작동함을 의미합니다.**   
**그러나 배열에서 `from`과 경로 지정은 관찰 가능 항목이 전체 배열이 아니라 배열의 개별 요소에 대해 작동한다는 것을 의미합니다.**