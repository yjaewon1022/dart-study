// 4. 주희는 영수와 369 게임을 하기로 했습니다. 1 ~ 40 까지의 숫자 중, "3" 이 포함된 숫자가 있을 경우 "짝" 을 출력하고,
//    아닌 경우 숫자를 출력하는 for 문과 while 문의 코드를 작성해보자.
//    (힌트1: https://api.dart.dev/dart-core/int/toString.html )
//    (힌트2: https://api.dart.dev/dart-core/String/contains.html )

void main() {
  // for (int i = 1; i <= 40; i++) {
  //   String number = i.toString();

  //   if (number.contains('3')) {
  //     print("짝");
  //   } else {
  //     print(i);
  //   }
  // }

  int i = 1;

  while (i <= 40) {
    String number = i.toString();

    if (number.contains("3")) {
      print("짝");
    } else {
      print(i);
    }

    i++;
  }
}
