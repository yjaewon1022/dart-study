void main() {
  // TODO: 구구단 1~9단 중 짝수단만 출력하는 반복문 작성 2,4,6,8단
  // 1. for 문 사용
  int number;
  int dan;

  for (dan = 2; dan <= 8; dan += 2) {
    for (number = 1; number < 10; number++) {
      print("$dan x $number = ${dan * number}");
    }
  }

  // // 2. while 문 사용
  int number2 = 1;
  int dan2 = 2;

  while (dan2 <= 8) {
    while (number2 < 10) {
      print("$dan2 x $number2 = ${dan2 * number2}");

      number2++;
    }

    number2 = 1;
    dan2 += 2;
  }
}
