// dart:io 라는 사용자의 입력을 제어할 수 있는 기능을 가져와서 사용할거야.
import 'dart:convert';
import 'dart:io';

void main() {
  var iList = <int>[]; // int형만 들어갈 수 있는 리스트구나!
  stdout.write("첫 번째 숫자를 입력해주세요.:"); // 화면에 글씨 출력
  var input = stdin.readLineSync(); // input 에 사용자가 입력한 값을 넣었구나!
  iList.add(int.parse(input!));
  // input 뒤에 ! 를 붙이게 되면 -> 컴퓨터에게 이 input은 무조건 값이 있을거야. 라고 명시하는 것
  // iList.add(int.parse(input));
  // 너가 input에 사용자가 값을 넣을 거라고 작성은 했지만,
  // 사용자가 값을 아무것도 입력하지 않았을 때에 대한 대처가 필요해!
  // int.parse(값) : 값을 int 형태로 변경할거야!
  // iList에 int 형으로 바꾼 input을 담을거야!

  stdout.write("두 번째 숫자를 입력해주세요.:");
  input = stdin.readLineSync();
  iList.add(int.parse((input?.isEmpty ?? true) ? '1' : input!));
  // input ?? '1' 이 코드는
  // input에 값이 있으면 그대로 input을 쓰고.
  // input에 값이 없으면 '1' 을 써라.
  // A ?? B -> A가 참(true)이면 A 를 쓰고, 거짓(false)이면 B를 써라.
  stdout.writeln(
    "더하기 프로그램을 진행합니다. ${iList[0]} + ${iList[1]} = ${iList[0] + iList[1]}",
  );
}
