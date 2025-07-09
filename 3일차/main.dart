class Integer {
  late int _value;

  // 생성자
  Integer([int givenValue = 0]) {
    _value = givenValue;
  }

  int get() {
    return _value;
  }

  void set(int getValue) {
    _value = getValue;
  }

  String get asString => "$_value";

  // TODO: int 형태로 반환하는 한 줄 getter 작성
  int get asInt => _value;

  set value(int givenInteger) => _value = givenInteger;
}

class TimemachineInteger extends Integer {}

class StringClass {
  late String _value;

  // 생성자
  StringClass([String givenString = '']) {
    _value = givenString;
  }

  String get() {
    return _value;
  }

  void set(String givenString) {
    _value = givenString;
  }
}

class Player {
  // TODO: 인스턴스 변수로 name, age 를 선언

  // TODO: 생성자 작성

  // TODO: 사용자의 이름을 반환하는 getter 함수
  // TODO: 사용자의 나이를 반환하는 getter 함수

  // TODO: 사용자의 이름을 수정하는 setter 함수
  // TODO: 사용자의 나이를 수정하는 setter 함수
}

void main() {
  var int1 = Integer();
  var int2 = Integer(3);

  // var string1 = StringClass('안녕?');

  // print(string1.get());
  // string1.set('잘가');
  // print(string1.get());

  // int1.set(10);
  int1.value = 112430;

  print(int1.asInt);
}
