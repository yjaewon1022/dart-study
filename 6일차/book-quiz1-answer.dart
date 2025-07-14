import 'dart:convert';
import 'dart:io';

void main() {
  stdout.write("안녕하세요. 출력하실 내용을 입력해주세요:");

  var input = stdin.readLineSync(encoding: utf8);
  stdout.writeln("입력한 값: $input");

  while (input != '그만') {
    stdout.write("안녕하세요. 출력하실 내용을 입력해주세요:");
    input = stdin.readLineSync(encoding: utf8);
    stdout.writeln("입력한 값: $input");
  }

  stdout.writeln("프로그램을 종료합니다.");
}
