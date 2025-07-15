// files 폴더 내에 다음의 Map 변수의 key 가 파일명이 되고,
// value 가 각 파일의 내용이 되도록 하는 코드를 구현하세요.
// 각 폴더들은 ./6일차/quiz 폴더에 저장되어야 합니다.
// 각 파일의 확장자는 .txt 입니다.

import 'dart:io';

void main() async {
  var files = {
    "file1": "file1 파일 내용입니다.",
    "file2": "file2 파일 내용입니다.",
    "file3": "file3 파일 내용입니다.",
  };

  // for 문을 이용한 Map 자료형 내부 데이터 접근하기
  // for (변수 in 범위) {}
  // 범위 내에 있는 각각의 데이터들을 변수 하나에 담아서, 중괄호 내의 코드를 실행하겠다.
  for (var key in files.keys) {
    // 파일 객체 생성
    // 파일 객체를 생성하는 것 만으로는 실제 파일이 생성되지 않는다.
    var file = File('./quiz/$key.txt');

    // 생성한 파일을 열겠다 를 의미하는 코드 작성
    // openWrite 를 작성을 해주어야 실제 파일이 생성된다.
    var sink = file.openWrite();

    // 파일에 내용을 추가하겠다 를 의미하는 코드 작성
    sink.write(files[key]);

    // Map 의 key 를 가지고 있을 때, 해당 key가 가지고 있는 value를 가져오는 방법?
    // Map변수[값을 가져올 key]
    // print(files[key]);

    String content = await file.readAsString();

    print(content);
  }
}
