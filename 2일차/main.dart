// 1. 철수는 시험에서 70점을 받았습니다.
// 아래 등급 기준표에 따라 철수의 등급을 if-else 문을 이용하여 다음과 같이 출력하는 코드를 작성해보세요.
// 91~100: A, 81~90: B, 71~80: C, 61~70: D, 51~60: E, 그 외: F
// [철수의 시험 점수는 $score 점, 이며, 등급은 $grade 입니다.]

void main() {
  int score = 70;
  String grade = '';

  if (score >= 91 && score <= 100) {
    grade = 'A';
  } else if (score >= 81 && score <= 90) {
    grade = "B";
  } else if (score >= 71 && score <= 80) {
    grade = "C";
  } else if (score >= 61 && score <= 70) {
    grade = "D";
  } else if (score >= 51 && score <= 60) {
    grade = "E";
  } else {
    grade = 'F';
  }

  print('철수의 시험 점수는 $score 점, 이며, 등급은 $grade 입니다.');
}

// 2. 키(176) 과 몸무게(63) 을 가진 영재는 본인의 BMI 가 궁금해졌습니다.
//    본인의 BMI 를 구하는 함수를 작성한 후, 영재의 BMI의 점수와, 점수에 따른 기준표 결과를 출력하는 코드를 작성해보세요.
//  ~ 18.4: 저체중 18.5 ~ 22.9: 정상, 23.0 ~ 24.9: 과체중, 25.0 ~ : 비만
//  [영재의 BMI 점수는 $score 점이며, 현재 $status 상태 입니다.]
// BMI 계산 방법: 체중 / (키(m) * 키(m))

// 3. 사용자의 이름, 전화번호, 나이를 입력받아 다음과 같이 출력하는 함수를 만들어보세요.
//    [제 이름은 $name, 전화번호는 $phone 이며, 제 나이는 $age 입니다.]
//    이때 나이는 필수 입력이 아니며, 나이를 입력하지 않은 경우 $age 부분을 "비공개"로 변경해서 표기해야 합니다.

// 4. 주희는 영수와 369 게임을 하기로 했습니다. 1 ~ 40 까지의 숫자 중, "3" 이 포함된 숫자가 있을 경우 "짝" 을 출력하고,
//    아닌 경우 숫자를 출력하는 for 문과 while 문의 코드를 작성해보자.
//    (힌트1: https://api.dart.dev/dart-core/int/toString.html )
//    (힌트2: https://api.dart.dev/dart-core/String/contains.html )
