# BehaviorRelay

## BehaviorRelay를 사용하기 위해 RxCocoa 설치
BehaviorRelay는 Rxcocoa 프레임워크의 일부이며 현재 Rxcocoa가 설치되어 있지 않습니다.   

먼저 cocoaPods를 사용하여 애플리케이션에 통합된 Rxcocoa를 다운로드하는 방법을 살펴보겠습니다. (RxSwift 설치와 동일)   

## BehaviorRelay 접근하기

<img src="https://user-images.githubusercontent.com/92699723/197444232-29e2dbd1-74c1-487b-b6cd-36422083d15c.png" width="500" height="300">

이제 변경 사항은 계속 진행하여 BehaviorRelay의 값을 변경하려고 하면 실제로 그렇게 할 수 없다고 불평할 것입니다.   
그리고 그 이유는 이 경우의 값이 실제로 읽기 전용이므로 변경할 수 없기 때문입니다.   
그러나 새 값을 받아 새 값을 할당할 수 있는 함수가 있습니다.   
따라서 기존 값만 변경할 수 있지만 변경할 수 없지만 새 값을 얻을 수 있습니다.   
<img src="https://user-images.githubusercontent.com/92699723/197444464-01bb897f-dcc8-42dc-93cf-0f14a82f5c10.png" width="500" height="500">   

## BehaviorRelay에 값을 추가하는 방법
그렇다면 Variables와 마찬가지로 BehaviorReally의 값에 항목을 추가하려면 어떻게 해야 할까요?

글쎄, 당신이 그것을 할 수있는 몇 가지 방법이 있습니다.

- 첫 번째 방법은 accept 메서드를 사용하는 것입니다.   
    이것을 relay.accept라고 부르고 기본적으로 추가하려는 새 배열을 전달합니다.
    `**그러나 원래 배열에 이미 일부 기존 값이 있는 경우에는 어떻게 합니까?**`

    그래서 여기(BehaviorRelay(value:))로 가서 이것을 제거하고 여기에 item1을 추가하거나 여기에 item1을 추가하고 초기 값과 item2를 새 값으로 추가하고 잘 실행하면 초기값이 없어집니다. 
    ```Swift
    let relay = BehaviorRelay(value: ["Item 1"])
        
    relay.accept(["Item 2"])
    
    relay.asObservable().subscribe {
        print ($0)
    }

    // Result
    // next(["Item 2"])
    ```
    이런 방법은 좋지 않습니다. 초기 값을 유지하고 싶었습니다.
- 두 번째 방법은 우리가 accept를 호출할 때, 
    우리는 실제로 당신이 가지고 있는 마지막 값을 제공하고 새 값을 추가하는 것과 관련될 수 있습니다.

    이 경우 다른 값을 연결하는 배열의 기본 작업을 단순히 수행할 배열에 배열을 추가합니다.
    ```Swift
    let relay = BehaviorRelay(value: ["Item 1"])
    
    relay.accept(relay.value + ["Item 2"])
    
    relay.asObservable().subscribe {
        print ($0)
    }

    // Result
    // next(["Item 1"], ["Item 2"])
    ```
- 👍🏻 세 번째 방법은 같은 작업을 수행하는 또 다른 방법은 값을 다른 변수로 이동하여 변수를 만들고 값이라고 부를 수 있도록 하는 것입니다.   
    그런 다음 relay.value라고 말할 수 있습니다.

    그런 다음 새 항목에서 item2를 추가하여 이 값을 변경할 수 있습니다. 원하는 경우 item3 등 여러 항목을 추가할 수도 있습니다.

    마지막으로, 새 값을 가져올 때입니다. 또는 단순히 수락을 호출하고 값을 전달할 수 있습니다. 이 경우에는 단순히 값입니다.

    ```Swift
    let relay = BehaviorRelay(value: ["Item 1"])
        
    var value = relay.value
    value.append("Item 2")
    value.append("Item 3")
    relay.accept(value)
    
    relay.asObservable().subscribe {
        print ($0)
    }

    // Result
    // next(["Item 1", "Item 2", "Item 3"])
    ```

    계속해서 이것을 실행하면 매우 유사한 결과를 볼 수 있으며 모든 값을 얻을 수 있으며 모든 값은 손실되지 않습니다.

    RxSwift가 움직이는 방향입니다.