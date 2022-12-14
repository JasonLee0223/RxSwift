# RxSwift <img src="https://user-images.githubusercontent.com/92699723/193454894-e169b5ff-abde-4862-be21-627aa667817b.png" width="30" height="30">

## [Udemy] Mastering RxSwift in iOS
|Section|Subject|Link|Explain|
|:-:|:--|:--|:--|   
|01|Introduce|[What is Functional Programming?](Mastering%20RxSwift%20in%20iOS/Section1.%20Introduce/What%20is%20Functional%20Programming?.md)|   
|||[What is RxSwift?](Mastering%20RxSwift%20in%20iOS/Section1.%20Introduce/What%20is%20RxSwift.md)|
|||[What is CocoaPods?](https://github.com/JasonLee0223/RxSwift/blob/main/Mastering%20RxSwift%20in%20iOS/Section1.%20Introduce/What%20is%20CocoaPods%3F.md)|
|||[Hello RxSwift (Install CocoaPods & apply to project)](Mastering%20RxSwift%20in%20iOS/Section1.%20Introduce/Hello%20RxSwift.md)|
|02|Observables|[What is an Observables?](https://github.com/JasonLee0223/RxSwift/blob/main/Mastering%20RxSwift%20in%20iOS/Section2.%20Observable/What%20is%20an%20Observable%3F.md)|
|||[Implementing Observables (Observable 구현하기)](Mastering%20RxSwift%20in%20iOS/Section2.%20Observable/Implementing%20Observables.md)|Observable Operators <br />(`just`, `of`, `from`)|   
|||[Implementing Subscriptions (Subscription 구현하기)](Mastering%20RxSwift%20in%20iOS/Section2.%20Observable/Implementing%20Subscriptions.md)| `of`와 `from`의 차이|
|||[Disposing and Termination](Mastering%20RxSwift%20in%20iOS/Section2.%20Observable/Disposing%20and%20Terminating.md)|`dispose()`, `DisposeBag()`, `create function`
|03|Subjects|[What are Subjects?](https://github.com/JasonLee0223/RxSwift/blob/main/Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/What%20are%20Subjects%3F.md)|
|||[Publish Subjects](Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/Publish%20Subjects.md)|`PublishSubject`|
|||[Behavior Subjects](Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/Behavior%20Subjects.md)|`BehaviorSubject` <br /> `BehaviorSubject와 PublishSubject의 차이점`|
|||[Replay Subjects](Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/Replay%20Subjects.md)|`ReplaySubject`|
|||[Variables](Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/Variables.md)|`Variables` <br /> `Variable(x) -> BehaviorRelay로 대체`|
|||[BehaviorRelay](Mastering%20RxSwift%20in%20iOS/Section3.%20Subjects/BehaviorRelay.md)|`BehaviorRelay`, `accept`, `RxCocoa`|
|04|Implementing Photo Filter App Using RxSwift|[What we will be building?](https://github.com/JasonLee0223/RxSwift/blob/main/Mastering%20RxSwift%20in%20iOS/Section4.%20Implementing%20Photo%20Filter%20App%20Using%20RxSwift/What%20we%20will%20be%20building%3F.md)|
|||[Requesting Permission to Accesss Photo Library](Mastering%20RxSwift%20in%20iOS/Section4.%20Implementing%20Photo%20Filter%20App%20Using%20RxSwift/Requesting%20Permission%20to%20Access%20Photo%20Library.md)|`Photos Framework` <br /> `Add PrivateKey at Info.plist`
|||[Fetching All Photo Assets](Mastering%20RxSwift%20in%20iOS/Section4.%20Implementing%20Photo%20Filter%20App%20Using%20RxSwift/Fetching%20All%20Photo%20Assets.md)|`enumerateObject`
|||[Displaying Photos from Photo Library](Mastering%20RxSwift%20in%20iOS/Section4.%20Implementing%20Photo%20Filter%20App%20Using%20RxSwift/Displaying%20Photos%20from%20Photo%20Library.md)|
|05|Filtering Operators|[Ignore](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Ignore.md)|
|||[Element At](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Element%20At.md)|
|||[Filter](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Filter.md)|
|||[Skip](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Skip.md)|
|||[Skip While](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Skip%20While.md)|
|||[Skip Until](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Skip%20Until.md)|
|||[Take](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Take.md)|
|||[Take While](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Take%20While.md)|
|||[Take Until](Mastering%20RxSwift%20in%20iOS/Section5.%20Filtering%20Operators/Take%20Until.md)|
|07|Transforming Operators|[To Array](Mastering%20RxSwift%20in%20iOS/Section7.%20Transforming%20Operators/To%20Array.md)|
|||[Map](Mastering%20RxSwift%20in%20iOS/Section7.%20Transforming%20Operators/Map.md)|
|||[FlatMap](Mastering%20RxSwift%20in%20iOS/Section7.%20Transforming%20Operators/Flat%20Map.md)|
|||[Flat Map Latest](Mastering%20RxSwift%20in%20iOS/Section7.%20Transforming%20Operators/Flat%20Map%20Latest.md)|
|09|Combining Operators|[Starts With](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Starts%20With.md)|
|||[Concat](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Concat.md)|
|||[Merge](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Merge.md)|
|||[Combine Latest](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Combine%20Latest.md)|
|||[With Latest From](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/With%20Latest%20From.md)|
|||[Reduce](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Reduce.md)|
|||[Scan](Mastering%20RxSwift%20in%20iOS/Section9.%20Combining%20Operators/Scan.md)|
|11|Error Handling|[Managing Errors](Mastering%20RxSwift%20in%20iOS/Section11.%20Error%20Handling/Managing%20Errors.md)|
|||[Throwing Errors](Mastering%20RxSwift%20in%20iOS/Section11.%20Error%20Handling/Throwing%20Errors.md)|
|||[Handle Errors with Catch](Mastering%20RxSwift%20in%20iOS/Section11.%20Error%20Handling/Handle%20Errors%20with%20Catch.md)|
|||[Retrying on Error](Mastering%20RxSwift%20in%20iOS/Section11.%20Error%20Handling/Retrying%20on%20Error.md)|