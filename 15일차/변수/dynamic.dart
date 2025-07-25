void main() {
  // 변수를 선언하고, 초기값을 지정해주지 않았음
  // 값을 지정해주지 않으면 컴퓨터는 해당 변수의 타입이 dynamic 이다 라고 이해하게 됨.
  // var name;
  dynamic name;

  // dynamic 이라는 타입을 사용하게 되면 어떤 값을 넣더라도 에러가 발생하지 않는 것을 확인할 수 있다.
  name = "짱구";
  name = 1.2;
  name = false;

  // name 이라는 변수는 현재 dynamic 이라는 여러가지 타입을 설정해줄 수 있기 때문에
  // name 뒤에 . 을 이용해서 추가 기능을 확인해보면 되게 적은 자동 완성을 추천해주는 것을 확인할 수 있다.
  // 어떻게 해야 dynamic 변수에서 각 타입을 분리해서 자동 완성을 추천하게 할 수 있을까?

  // is = 앞에 있는 변수가 오른쪽에 있는 타입인지 확인해주는 기능
  // 다음의 if 문을 사용해도 됨 if (name.runtimeType == String) {}
  if (name is String) {
    // if 문 내부의 중괄호에서는 name 이 항상 String 타입이라는 것을 확인했기 때문에
    // String 타입의 자동 완성을 추천해주는 것을 확인할 수 있음
    name.contains("짱구");
  } else if (name is int) {
    // 여기 else if 구문에서는 name이 항상 int 타입이라는 것을 확인할 수 있게 되겠죠
    print(name.isOdd);
  }
}
