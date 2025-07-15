// 다음 코드에서 빠진 부분을 채워,
// './6일차/quiz/temp.txt' 파일에 'Dart는 재미있어요!' 라는 문자열을 저장한 후,
// 그 내용을 다시 읽어 출력하는 프로그램을 완성하세요.

import 'dart:io';

void main() async {
  // ./quiz/temp.txt에 있는 파일을 사용하겠다. 라고 File 객체를 선언함
  var file = File('./quiz/temp.txt');

  // 파일에 문자열 저장 (빈칸을 채우세요)
  var sink = file.openWrite(); // file 변수의 파일을 열어서, 내용을 수정하겠다.
  sink.write("Dart는 재미있어요!");
  await sink.close();

  // 저장한 내용을 다시 읽기 (빈칸을 채우세요)
  String content = await file.readAsString();

  print(content);
}
