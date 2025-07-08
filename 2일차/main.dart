// 사칙연산을 하는 함수 만들어보기
// 더하기
int add(int num1, int num2) {
  return num1 + num2;
}

// 빼기
num sub(int num1, num2) {
  return num1 - num2;
}

// 곱하기
num mul(int num1, num2) {
  return num1 * num2;
}

// 나누기
num div(int num1, num2) {
  return num1 / num2;
}

void main() {
  int number1 = 10, number2 = 5;

  var addNumber = add(number1, number2);
  var subNumber = sub(number1, number2);
  var mulNumber = mul(number1, number2);
  var divNumber = div(number1, number2);

  print(addNumber);
  print(subNumber);
  print(mulNumber);
  print(divNumber);
}
