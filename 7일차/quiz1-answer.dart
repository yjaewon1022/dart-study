// dart 표준 라이브러리 사이트 https://api.dart.dev/dart-math/ 를 참고하여
// 1 ~ 10 까지의 숫자 중 랜덤한 숫자를 A 와 B 라고 선언된 두 변수에 담고
// 두 변수 중 더 큰 숫자를 반환하는 프로그램을 구현하세요.
// Run 실행 시 실행 결과는 다음과 같이 작동해야 합니다.
// A가 더 클 경우: [A가 5, B가 3 이므로, A가 더 큽니다.]
// A와 B가 같은 경우: [A가 3, B가 3 이므로, 두 숫자가 동일합니다.]
// B가 더 클 경우: [A가 2, B가 7 이므로, B가 더 큽니다.]

import 'dart:math';

void main() {
  int A = Random().nextInt(10) + 1, B = Random().nextInt(10) + 1;
  print("$A $B");

  int maxResult, minResult;

  maxResult = max(A, B);
  minResult = min(A, B);

  // 두 수가 같은지 확인
  if (A == B) {
    print("A가 $A, B가 $B 이므로, 두 숫자가 동일합니다.");
  } else {
    if (minResult == A) {
      print("A가 $A, B가 $B 이므로, B가 더 큽니다.");
    } else {
      print("A가 $A, B가 $B 이므로, A가 더 큽니다.");
    }
  }
}
