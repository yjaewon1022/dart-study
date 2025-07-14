// dart:io 라는 사용자의 입력을 제어할 수 있는 기능을 가져와서 사용할거야.
import 'dart:convert';
import 'dart:io';

void main() {
  // stdout : standard output 단어를 줄여서 작성한 것
  //          Dart에서 화면 출력 기능을 담당하고 있음
  // stdin : standard input 단어를 줄여서 작성한 것
  //         Dart에서 키보드 입력을 지원하고 있음
  stdout.write("입력해주세요:");
  var userInput = stdin.readLineSync(encoding: utf8);
  stdout.writeln("당신은 이것을 입력했습니다.: $userInput");

  while (userInput != "exit") {
    stdout.write("입력해주세요:");
    userInput = stdin.readLineSync(encoding: utf8);
    stdout.writeln("당신은 이것을 입력했습니다.: $userInput");
  }

  stdout.writeln("입력이 종료되었습니다.");

  // // writeln : 소괄호 안에 있는 내용을 출력하고, 들여쓰기를 진행한다.
  // // write : 소괄호 안에 있는 내용을 출력한다.
  // stdout.writeln("출력2");
  // stdout.write("출력1");
}
