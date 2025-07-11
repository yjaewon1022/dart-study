class Box {
  late int item;

  Box(int givenItem) : item = givenItem;

  int get() {
    return item;
  }

  void set(int newItem) {
    item = newItem;
  }
}

class StringBox {
  late String item;

  StringBox(String givenItem) : item = givenItem;

  String get() {
    return item;
  }

  void set(String newItem) {
    item = newItem;
  }
}

// 타입이 바뀌었다고 새롭게 클래스를 하나 더 만들면
// 똑같은 기능을 하는 클래스가 하나 더 필요하게 되네?
// 그러면 너무 코드 작성하는것도 귀찮고, 한 번에 합칠수는 없을까?
// -> 이 때 Generic 을 사용하면 됨.

// Generic을 적용한 클래스 선언 방법
// class 클래스명<T> {}
class NewBox<T> {
  late dynamic item;

  // 사용자가 입력한 givenValue 의 자료형을 항상 따라갈거야.
  // 사용자가 1 을 입력하게 되면 T -> int 자료형이 되는거고
  // 사용자가 "시계" 를 입력하게 되면 T -> String 자료형이 되는거고
  NewBox(T givenValue) {
    item = givenValue;
  }

  dynamic get() {
    return item;
  }

  void set(dynamic newItem) {
    item = newItem;
  }
}

void main() {
  var newBox = NewBox("참돔");

  print(newBox.get());
  newBox.set(34142314231423);
  print(newBox.get());
  newBox.set(1342.234);
  print(newBox.get());
}
