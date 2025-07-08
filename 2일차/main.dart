void main() {
  // TODO: 구구단 1단 만들기
  var dan = 1;
  var count = 1;
  var result = 0;

  for (count = 1; count <= 9; count++) {
    result = count * dan;
    print("$dan x $count = $result");
  }
}
