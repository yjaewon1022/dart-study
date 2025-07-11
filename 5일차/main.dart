void doBG(int time, var jobEnd) {
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

Future<String> serveCustomer() async {
  print("serveCustomer: 고객 주문 대기중");
  var customerOrder = await simulateCustomerOrder();
  print("serveCustomer: 고객의 주문 '$customerOrder' 를 받음");

  return customerOrder;
}

Future<String> simulateCustomerOrder() {
  return Future.delayed(Duration(seconds: 2), () => '아이스 커피');
}

void main() async {
  var finished = Flag(false);

  print("main: 메인 함수 실행");
  doBG(5, finished);

  var customerOrder = await serveCustomer();
  print("main: 고객의 주문을 받음 : $customerOrder");

  while (finished.activated == false) {
    await Future.delayed(Duration(seconds: 1));
  }

  print("main: 메인 함수 종료");
}
