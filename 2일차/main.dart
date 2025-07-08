void main() {
  // TODO: 구구단 1~9단 중 짝수단만 출력하는 반복문 작성 2,4,6,8단
  // // 1. for 문 사용
  // int dan, number;
  // for (dan = 2; dan <= 8; dan = dan + 2) {
  //   for (number = 1; number < 10; number++) {
  //     print("$dan x $number = ${dan * number}");
  //   }
  // }

  // 2. while 문 사용
  int dan = 2, number = 1;

  while (dan <= 8) {
    while (number <= 9) {
      print("$dan x $number = ${dan * number}");

      number++;
    }

    number = 1;

    dan = dan + 2;
  }
}
