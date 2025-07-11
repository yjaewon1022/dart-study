// NegativeDivisorException 이라는 클래스를 만들건데,
// Exception 이라는 가상클래스를 참조해서 구현할거야.
class NegativeDivisorException implements Exception {
  @override
  String toString() {
    return "0으로 숫자를 나눌 수 없습니다.";
  }
}

int calc(int a, int b) {
  int result = 0;

  if (result == 0) {
    // throw = 스스로 에러를 만들어서 코드 진행을 막고 싶을 때 사용하는 문법
    throw NegativeDivisorException();
  } else {
    result = a ~/ b;
  }

  return result;
}

void main() {
  int num1 = 1;
  int num2 = 0;
  int result = 0;

  try {
    result = calc(num1, num2);
  } on NegativeDivisorException {
    print("현재 num2가 0입니다.");
    num2 = 1;
    print("num2 를 1로 바꾸고 다시 시도합니다.");
    result = num1 ~/ num2;
  } finally {
    print("결과는 : $result 입니다.");
  }
}
