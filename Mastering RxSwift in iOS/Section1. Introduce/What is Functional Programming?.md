# 함수형 프로그래밍(POP)이란 무엇인가?
함수형 프로그래밍에는 다양한 개념이 있으며 가장 중요한 개념 중 하나인 가변성(mutability)은 모든 것이 불변이며 실제로 아무 것도 변경할 수 없음을 의미합니다.

우리가 명령형 프로그래밍에 대해 이야기할 때는 완벽하게 괜찮습니다.   
객체 지향 프로그래밍은 우리에게 친숙한 프로그래밍입니다. 

하지만 함수형 프로그래밍에서 같은 일을 하려고 하면 `age`를 만들고 `age`를 변경한 다음 함수를 호출합니다.   
이 함수를 `doSomething`라고 하며 `age`도 67세로 변경합니다.

## Imperative Programming (명령형 프로그래밍)
```Swift
var age = 30
// some code here
age = 45
```

## Functional Programing (함수형 프로그래밍)
```Swift
//MARK: - 잘못된 예시 (실제로 동작하지않는다.)
var age = 30
// some code here
age = 45

func doSomething() {
    print("Hello World!")
    age = 67
}

print(age)  // age is 45
doSomething()
print(age)  // age is 67
```

함수 프로그래밍의 모든 것, 생성하는 변수는 실제로 일정하며 변경할 수 없습니다. 불변 상태이기 때문이다.   
**따라서 함수형 프로그래밍에서는 변수의 상태를 변경할 수 없습니다.**

### Mutable State
- In Object oriented Programming   
    즉 변경 가능한 상태가 있으면 누구든지 값을 변경할 수 있다는 것을 의미합니다.   
    그러면 동시성을 다루는 데 몇 가지 문제가 발생합니다.   

    문제는 열악한 조건을 갖게 될 것이며 또한 Dedlock을 갖게 될 것입니다.   
    무언가가 무언가를 기다리고 있고 무언가가 기다리고 있다는 것은 또 다른 무언가를 기다리고 기다리고 있습니다.   

    이 모든 일은 객체 지향 세계 또는 명령형 프로그래밍으로 작업할 때 발생할 수 있습니다.   

- In Functional Progrmming   
    모든 것이 불변 상태이므로 실제로 변경할 수 없습니다.   
    이러한 모든 것은 동시성 문제가 없는 방식으로 진행됩니다.   
    교착 상태(Dead Lock)가 없으며 다른 것에 의존하는 것이 없습니다.

    `the First Class and Higher-Order Function`라는 개념도 있었고,   
    **함수 프로그래밍에서 `고차 함수는 다른 함수를 받아서 반환할 수 있는 함수를 의미합니다.`**

    **`함수형 프로그래밍의 모든 것도 순수 함수입니다.`**   
    이것은 함수가 동일한 입력을 받았을 때 항상 동일한 출력을 생성하고 함수 외부에 다양한 부작용을 생성한다는 것을 의미합니다.   
    가변성이 작용하고 있습니다. 상태를 실제로 변경할 수는 없습니다.   
    **`즉, 함수형 프로그래밍에서는 상태를 변경할 수 없습니다.`**   

    - The function always produces the same output when given the same input.   
    함수는 동일한 입력이 제공될 때 항상 동일한 출력을 생성합니다.
    
    - The function creates zero side effects outside of it.   
    이 함수는 외부에 부작용이 전혀 발생하지 않습니다.