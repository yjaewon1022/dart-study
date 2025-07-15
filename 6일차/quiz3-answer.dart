// 사용자에게 저장할 파일 이름과 내용을 입력받아,
// 해당 이름의 파일을 './6일차/quiz' 폴더 안에 생성하고, 입력받은 내용을 저장한 뒤
// 다시 파일을 읽어 내용을 출력하는 프로그램을 완성하세요.
import 'dart:convert';
import 'dart:io';

void main() async {
  stdout.write("저장할 파일 이름을 입력하세요 (예: note.txt): ");
  String filename = stdin.readLineSync()!;

  stdout.write("저장할 파일 내용을 입력하세요: ");
  String content = stdin.readLineSync(encoding: utf8)!;

  // 파일 객체 생성
  var file = File("./quiz/$filename");

  // 파일 스트림 열기 및 쓰기
  var sink = file.openWrite();
  sink.write(content);

  // 스트림 닫기
  await sink.close();

  // 파일 다시 읽어서 출력
  String result = await file.readAsString();
  print(result);
}
