// 1. Dart는 기본적으로 한 줄씩 차례로 실행하는 "동기적인 언어"입니다.

// 2. 하지만 시간이 오래 걸리는 작업(예: 서버 통신)은 멈추지 않고 넘기기 위해
//    "비동기"로 처리할 수 있습니다.

// 3. 비동기 처리를 하려면 함수에 async 키워드를 붙이고,
//    시간이 오래 걸리는 작업 앞에는 await를 붙입니다.

// 4. await는 결과가 나올 때까지 기다렸다가, 다음 줄 코드를 실행합니다.

doBG(int time, var jobEnd) {
  if (time > 0) {
    print("$time 초 남았습니다.");
    Future.delayed(Duration(seconds: 1), () => doBG(time - 1, jobEnd));
  } else {
    print("밥이 준비되었습니다.");
    jobEnd.activated = true;
  }
}

class Flag {
  late bool _flag;

  Flag(bool givenFlag) : _flag = givenFlag;
  bool get activated => _flag;
  set activated(bool givenFlag) => _flag = givenFlag;
}

void main() async {
  var finished = Flag(false);

  print("밥 주문하기");
  await doBG(5, finished);

  while (finished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }

  print("밥 먹기");
}
