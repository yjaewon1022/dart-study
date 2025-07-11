void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  // try = 일단 먼저 실행을 해봐라
  // catch = try 중 에러가 발생하면, try 실행을 멈추고 catch 이후의 내용을 실행해라.

  // try-catch 문법 사용 방법: try {} catch(error) {}
  try {
    result = num1 ~/ num2; // 1 ~/ 0
  } catch (error) {
    print("catch: $error");

    num2 = 1;
    print("catch: num2를 1로 바꾸고 기존 코드를 다시 실행");
    result = num1 ~/ num2;
  }

  print("결과는 : $result 입니다.");
}
