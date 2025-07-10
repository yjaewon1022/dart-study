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

  Integer operator +(Integer givenValue) {
    return Integer(_value + givenValue.get());
  }

  String get asString => "$_value";
}

mixin ActivationFlag on Integer {
  bool _flag = true;

  bool get activated => _flag;
  set activated(bool givenFlag) => (_flag = givenFlag);
}

class ADFSFDSFAF {}

class newInteger extends Integer with ActivationFlag {
  List<int> _list = [];

  newInteger([int givenValue = 0]) {
    _value = givenValue;
  }

  @override
  void set(int givenValue) {
    if (activated == true) {
      _list.add(_value);
      print("set 함수 실행함. 현재 저장된 결과는 $_list 임");
    } else {
      print("set 함수 실행 안함.");
    }

    super.set(givenValue);
  }

  @override
  String get asString => "현재 값: $_value, 기존에 지정했었던 값들: $_list";

  List getOld() {
    return _list;
  }
}

void main() {
  var num1 = newInteger();

  num1.set(2);
  num1.set(4);

  num1.activated = false;

  num1.set(6);
  num1.set(8);

  num1.activated = true;
  num1.set(8);
}
