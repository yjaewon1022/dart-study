// 가게를 뜻하는 Shop 클래스를 만들어라.
// 이 Shop 클래스는 어떤 물건을 파는지라는 뜻을 가진
// item 이라는 인스턴스 변수를 가지고 있다.
// 이 가게에서는 여러가지 물건을 번갈아가며 팔고 있는데,
// 다음과 같은 main 함수가 있다고 가정했을 때
// 이 기능을 정상적으로 동작하는 Generic 클래스를 만들어보세요.

class Shop<T> {
  // T = String
  late T item; // late String item;

  Shop(T givenItem) {
    item = givenItem;
  }

  void changeItem(T input) {
    item = input;
  }

  T getSellingItem() {
    return item;
  }
}

void main() {
  var shop = Shop("아디다스");

  shop.changeItem("청바지");
  print(shop.getSellingItem()); // 출력값은 [청바지] 로 나와야 함.
  shop.changeItem("100.1");
  print(shop.getSellingItem()); // 출력값은 ["100.1"] 로 나와야 함.

  var shop2 = Shop(123);
  shop2.changeItem(1111);
}
