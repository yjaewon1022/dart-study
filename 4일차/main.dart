class Integer {
  late int _value;

  Integer([int givenNumber = 0]) {
    _value = givenNumber;
  }

  int get() {
    return _value;
  }

  void set(int givenNumber) {
    _value = givenNumber;
  }

  String get returnString => "$_value";

  set changeInteger(int givenNumber) => _value = givenNumber;

  // 오버로딩 = 기존 클래스에서 함수를 추가하여 클래스를 강화하는 것.
  // 함수의 선언 방법
  // 반환할값 함수명 ( 사용자가 입력해야 하는 값 ) { 실제 동작할 내용 }

  // 더하기
  int add(int givenValue) {
    return _value + givenValue;
  }

  // 빼기
  int sub(int givenValue) {
    return _value - givenValue;
  }

  // 연산자가 함수 이름이 되는 함수
  Integer operator +(Integer givenValue) {
    return Integer(_value + givenValue.get());
  }

  // 빼기가 함수 이름이 되는 함수
  Integer operator -(Integer givenValue) {
    var result = _value - givenValue.get();
    var result2 = Integer(result);

    print("이거 썼니?");

    return result2;
  }

  // 곱하기가 함수 이름이 되는 함수
  Integer operator *(Integer givenValue) {
    var result = _value * givenValue.get();
    var result2 = Integer(result);

    print("* 이거 썼니?");

    return result2;
  }

  // 심화: 나누기가 함수 이름이 되는 함수
}

void main() {
  var num1 = Integer(5);
  var num2 = Integer(10);
  var num3 = num1 + num2;
  var num4 = num1 - num2;
  var num5 = num1 * num2;

  print(num3.get());
  print(num4.get());
  print(num5.get());
}
