void main() {
  // const = 변수의 값을 수정할 수 없는 변수형
  // const 는 compile-time 에 해당 변수의 값을 알고 있어야 한다.
  // compile-time이 무엇이냐?
  // run debugging 을 해서 main 함수를 실행하게 되면
  // 컴퓨터는 맨 위의 코드부터 한 줄 한줄 컴파일 이라는 것을 진행함
  // 컴파일 = 컴퓨터 내에서 실제로 코드를 실행할 수 있도록 값을 확인하는 것

  // 즉, const 로 선언된 변수는 항상 기본값이 존재해야 한다. 라는 뜻을 가지고 있습니다.
  const name = "";

  // hello 라는 변수는 const 로 선언이 되어서 기본값이 존재해야 하는데
  // 함수 같은 경우, hello 라는 변수가 선언되었을 때 sayHello 라는 함수는 현재 실행이 되지 않아서
  // 값을 가지고 있지 않게 됩니다.
  // 그렇기 때문에 const 로 선언된 변수는 함수는 기본값으로 설정을 할 수 없게 되는 것입니다.
  const hello = sayHello();

  // 값을 변경할 수 없는 변수에 함수를 담고 싶다면 const가 아닌 final 을 이용해야 한다.
  final hello2 = sayHello();

  // final 은 compile-time 에 값이 존재하지 않아도 됨.
  final name2;

  name2 = "";
}

String sayHello() {
  print("hello");
  return "hello";
}
