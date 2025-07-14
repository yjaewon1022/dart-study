import 'dart:io';
import 'dart:convert';

Future<String> readFileToString(String filename) async {
  var file = File(filename);
  // file.readAsString() -> 한 번에 파일을 통으로 가져와서 읽는다.
  // 용량이 작거나 내용이 적은 파일을 조회할 때 용이하게 사용이 가능하다.
  // 단, 용량이 크거나 내용이 많은 경우 파일을 읽을 때 오랜 시간이 걸린다.
  String fileContent = await file.readAsString();
  return fileContent;
}

Future<List<String>> readFileToList(String filename) async {
  // Stream -> 하나의 파일을 부분 부분 잘라서 필요한 부분을 이용한다.
  // 물을 틀 때 수도꼭지를 이용해서 틀었다가, 필요한 부분이 충족되면 잠시 수도꼭지를 잠구듯이
  // 필요한 부분 부분을 나누어서 파일을 읽는다.

  // File(filename) -> filename의 파일을 찾는다.
  // openRead() -> 파일을 Stream 형태로 읽어서 반환하겠다.
  // transform(utf8.decoder) -> 가져온 파일을 utf8 유니코드로 변경하겠다.
  // transform(LineSplitter()) -> 가져온 파일을 한 줄 한 줄 잘라 사용할 수 있게 변경하겠다.
  Stream<String> lines = File(
    filename,
  ).openRead().transform(utf8.decoder).transform(LineSplitter());

  try {
    List<String> sList = []; // lines 에서 잘라냈던 코드 줄들을 저장할 변수

    // 잘라낸 코드 줄들을 각각 분할해서 접근할 수 있게 해주는 반복문
    await for (var line in lines) {
      sList.add(line); // sList 리스트에 잘라낸 코드 줄들을 추가
    }
    return sList;
  } catch (error) {
    throw error;
  }
}

void main() async {
  List<String> fileContent = await readFileToList('./6일차/src.txt');

  var sList = [];
  var iVar1 = 0;
  var iVar2 = 0;
  var count = 0;
  var dstSink = File("./6일차/dst.txt").openWrite();

  dstSink.write(":=> FILE ACCESSED ${DateTime.now()}\n");

  for (var fileLine in fileContent) {
    sList = fileLine.split(',');
    iVar1 = int.parse(sList[0]);
    iVar2 = int.parse(sList[1]);

    print("$iVar1 x $iVar2 = ${iVar1 * iVar2}\n");
    dstSink.write("$iVar1 x $iVar2 = ${iVar1 * iVar2}\n");
    count++;
  }

  dstSink.write(':=> $count ITEMS CALCULATED');

  dstSink.close();
}
