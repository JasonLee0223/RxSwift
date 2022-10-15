# What is RxSwift?

> RxSwift, in its essence, simplifies developing asynchronous programs by allowing your code to react to new data and process it in sequential, isolated manner.

본질적으로 RxSwift는 코드가 새로운 데이터에 반응하고 순차적이고 격리된 방식으로 처리할 수 있도록 하여 비동기식 프로그램 개발을 단순화합니다.

## Explanation by example
TabBar Controller를 포함하고 어떤 항목을 정렬하는 TableView가 있다고 가정해보자.   
이 특정 응용프로그램이 수행하는 다른 종류의 작업이 비동기식으로 일부 이미지를 다운로드 한다거나 상단에 탭버튼을 사용할 수 있다.   

이 모든 일이 동시다발적으로 일어나고 있으며 우리는 `Notification Center`, `Delegate Pattern`, `Grand Central Dispatch`, `Closure` 를 사용하여 비동기식으로 엑세스해야하므로 이 방법들은 이미 iOS Cocoa Touch Framework에 포함되어있다.   
**`이제 문제는 이것들이 실제로 비동기식으로 설계되지 않았다는 것이다!!`**   

이 부분이 바로 우리가 생각하는 코드처럼 만들거나 작동하는 코드에 대한 생각을 작성하는 데 방해가 되는 이유입니다.   
> 이것이 바로 RxSwift가 해결하고자 하는 것입니다.   
**RxSwift는 훨씬 더 간결하고 간결하며 유지 관리 가능한 방식으로 비동기 코드를 작성할 수 있게 해주는 라이브러리입니다.**