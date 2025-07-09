class Integer {
  // 인스턴스 변수 -> 클래스 내에서 선언되는 변수
  late int _value;

  // 생성자가 필요함. ( 메인에서 사용해서, 상단에 입력했던 변수에 값을 담아주기 위해 )
  // 생성자이름() {};
  // 생성자의 이름은 클래스의 이름과 동일해야 함.
  // 생성자의 소괄호 안에는 사용자가 입력해준 값을 인스턴스 변수에 담기 위해 사용됨.
  // 생성할 때 변수를 입력하고 싶지 않다면 대괄호 [] 안에 변수를 선언하고, 기본값을 주면 됨
  Integer([int givenNumber = 0]) {
    // 사용자가 입력한 givenNumber 를 우리의 인스턴스 변수 안에 담을거야.
    _value = givenNumber;
  }

  // 인스턴스 변수를 반환하기 위한 함수
  int get() {
    return _value;
  }

  // 인스턴스 변수를 수정하기 위한 함수
  void set(int givenNumber) {
    _value = givenNumber;
  }

  // get, set을 계속 작성하기 너무 많으니 이걸 정리해서 getter 와 setter로 만들어보자!
  // getter 의 사용법
  // 반환할자료타입 get 함수명 => 반환할값;
  String get returnString => "$_value";

  // setter 의 사용법
  // set 함수명(사용자입력값) => 변경할내용;
  set changeInteger(int givenNumber) => _value = givenNumber;
}

void main() {
  // 클래스 사용
  var num1 = Integer(12431432143);

  // print(num1.get());

  // num1.set(112);

  // print(num1.get());

  // setter 사용 방법
  // 클래스.작성한함수 = 변경할값;
  num1.changeInteger = 11;

  // getter 사용 방법
  // 클래스.작성한함수;
  print(num1.returnString);
}
