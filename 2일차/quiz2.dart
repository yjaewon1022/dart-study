// 2. 키(176) 과 몸무게(63) 을 가진 영재는 본인의 BMI 가 궁금해졌습니다.
//    본인의 BMI 를 구하는 함수를 작성한 후, 영재의 BMI의 점수와, 점수에 따른 기준표 결과를 출력하는 코드를 작성해보세요.
//  ~ 18.4: 저체중 18.5 ~ 22.9: 정상, 23.0 ~ 24.9: 과체중, 25.0 ~ : 비만
//  [영재의 BMI 점수는 $score 점이며, 현재 $status 상태 입니다.]
// BMI 계산 방법: 체중 / (키(m) * 키(m))

double bmi(double m, int kg) {
  double score = 0.0;
  score = kg / (m * m);

  return score;
}

void main() {
  double m = 1.76;
  int kg = 63;

  double score = bmi(m, kg);
  String status = '';

  if (score <= 18.4 && score <= 0) {
    status = '저체중';
  } else if (score <= 22.9 && score >= 18.5) {
    status = '정상';
  } else if (score <= 23.0 && score >= 24.9) {
    status = '과체중';
  } else {
    status = '비만';
  }

  print("영재의 BMI 점수는 $score 점이며, 현재 $status 상태 입니다.");
}
