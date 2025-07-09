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
