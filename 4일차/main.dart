class Integer {
  late int _value;

  // // 생성자를 만드는 방법 1.
  // Integer([int givenNumber = 0]) {
  //   _value = givenNumber;
  // }

  // 생성자를 만드는 방법 2.
  Integer([int givenValue = 0]) : _value = givenValue;

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

  String get asString => "$_value";
}

// extends = 다음으로 적힐 클래스명에 있는 모든 내용들을 가져올거야.
// class newInteger extends 클래스명 {}
class newInteger extends Integer {
  // List<자료형> = 이 자료형에 속하는 데이터만 이 리스트에 담을거야.
  List<int> _list = []; // [0]

  newInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  @override // Integer 클래스에 있는 코드에서 이 기능들을 더 추가해서 쓸거야.
  void set(int givenValue) {
    _list.add(_value); // _value = 2

    // super = 우리가 클래스를 생성할 때 extends 뒤에 쓴 클래스 를 지칭함.
    super.set(givenValue);
  }

  @override
  String get asString => "현재 값: $_value, 기존에 지정했었던 값들: $_list";

  List getOld() {
    return _list;
  }
}

void main() {
  var newNum1 = newInteger(); // newNum1 = 0;

  newNum1.set(9); // newNum = 9; _list = [0]
  newNum1.changeInteger = 2; // newNum = 2; _list = [0]
  print(newNum1.get());

  newNum1.set(10); // newNum1 = 10; _list = [0, 2]
  print(newNum1.getOld());
  print(newNum1.asString);
}
