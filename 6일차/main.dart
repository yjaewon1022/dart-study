import 'dart:io';

void main() {
  var iList = <int>[];
  var sList = <String>[];

  stdout.write("숫자 두 개를 , 를 통해 입력해주세요. (예시: 3, 3)");
  var input = stdin.readLineSync();
  sList = input!.split(',');

  for (var item in sList) {
    iList.add(int.parse(item));
  }

  // 화면에 값을 출력할 때, String 과 String 을 + 하게 되면 해당 문자열들끼리 붙여 쓴 값이 출력됨
  // int 와 int 를 + 했을 땐, 두 수를 더해진 값이 출력됨
  stdout.writeln(
    "더하기 프로그램을 진행합니다. ${iList[0]} + ${iList[1]} = ${iList[0] + iList[1]}",
  );
}
