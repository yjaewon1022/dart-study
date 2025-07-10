// TODO: 1 ~ 100 까지의 숫자 중 짝수에 해당하는 수만 List에 담아서 출력해라.

void main() {
  List list = [];

  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      list.add(i);
    }
  }

  print(list);
}
