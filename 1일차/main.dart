// https://github.com/drsungwon/Dart-flutter-book

void main() {
  // 정수형 변수 선언
  int num1 = 4;
  print(num1); //

  // 실수형
  double num2 = 1.1234;
  print(num2);

  // 값을 변경할 수 없는 변수
  const num3 = 123;
  final num4 = 456;
  print(num3);
  print(num4);

  // 값을 유동적으로 변경할 수 있는 자료형
  dynamic variable = 13;
  variable = '123';

  // 연산자
  // + - * / ~/ % -- ++ += -=

  // 문자 출력
  print("number $variable");

  // 들여쓰기
  print('123\n456');

  String char = """
sdfgsdfg



asdfasdfasd
""";

  print(char);
}
