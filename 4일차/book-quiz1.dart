// 1. Integer 클래스를 하나 생성한 후, val 이라는 인스턴스 변수를 생성해보자.
//    val 의 기본값은 0이다.
class Integer {
  late int val;

  // 2. Integer 클래스의 생성자는 203페이지의 생성자 생성 방법을 이용해서 작성해보자.
  Integer([int givenVal = 0]) : val = givenVal;

  // 3. Integer 클래스에서는 val 이라는 인스턴스 변수를 return 하는 get 함수와
  //    값을 변경하는 set 함수가 있어야 한다.
  int getInt() {
    return val;
  }

  void setInt(int userInput) {
    val = userInput;
  }
}

// 4. Integer 클래스를 extends 하는 GoodInteger 라는 클래스를 생성한다.
class GoodInteger extends Integer {
  // 5. GoodInteger 클래스에 goodList 라는 List 형 인스턴스 변수를 생성해보자.
  //    goodList의 기본 값은 [] 이다.
  late List goodList = [];

  GoodInteger([int givenValue = 0]) {
    val = givenValue;
  }

  // 6. Integer 클래스에 존재하는 set 함수를 @override 하여,
  //    값이 변경될 때 마다 goodList에 변경된 값을 저장하는 함수를 만들어보자.
  @override
  setInt(int userInput) {
    goodList.add(val);

    super.setInt(userInput);
  }

  // 7. goodList 의 값들을 return 하는 함수를 만들어보자.
  List returnList() {
    return goodList;
  }
}

void main() {
  var num1 = GoodInteger(9);

  print(num1.getInt());
  print(num1.returnList());

  num1.setInt(1616);

  print(num1.getInt());
  print(num1.returnList());
}
