// 클래스 내에서는 같은 이름을 가진 함수를 사용할 수 있다. ( X )
class Test {
  Test() {}

  hello() {
    print("hello");
  }

  hello123() {}

  operator +(int numb) {
    //
  }
}

// 추상 클래스는 main() 함수에서 사용할 수 있다. ( X )

// 클래스 내에서 연산자를 함수명으로 사용해야 할 때 연산자 앞에 무엇을 작성해야 하는가? (주관식)
// operator
