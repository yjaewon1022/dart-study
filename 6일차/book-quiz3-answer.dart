// 다음과 같은 식단표가 존재합니다.
// 사용자가 날짜를 입력했을 때 그 날짜의 식단표를 출력하는 프로그램을 구현하세요.
// 만약 입력한 날짜가 휴무일인 경우, [급식을 진행하지 않는 날입니다.] 라는 문구가
// 입력한 날짜에 대한 식단표가 존재하지 않는 경우, [급식이 존재하지 않는 날입니다.] 라는 문구가
// 출력되어야 합니다.

// 식단표 출력 프로그램 - 날짜를 입력하세요 : 7/14
// 식단표 출력 프로그램 - 7/14의 식단표 : 어묵국, 흰쌀밥, 포기김치
// 식단표 출력 프로그램 - 이어서 출력할까요? : 네
// 식단표 출력 프로그램 - 날짜를 입력하세요 : 7/16
// 식단표 출력 프로그램 - 급식을 진행하지 않는 날입니다.
// 식단표 출력 프로그램 - 이어서 출력할까요? : 네
// 식단표 출력 프로그램 - 날짜를 입력하세요 : 7/17
// 식단표 출력 프로그램 - 급식이 존재하지 않는 날입니다.
// 식단표 출력 프로그램 - 이어서 출력할까요? : 아니오
// 프로그램을 종료합니다.

import 'dart:convert';
import 'dart:io';

void main() {
  var dayInput, doAgainInput;
  bool doAgain = true;

  var foods = {
    "7/14": "어묵국, 흰쌀밥, 포기김치",
    "7/15": "된장국, 잡곡밥, 어묵볶음, 비엔나소세지, 깍두기",
    "7/16": "휴무일",
  };

  // while 에서 bool 을 조건으로 입력하는 경우,
  // while(doAgain) 과 while(doAgain == true) 는 똑같은 동작을 한다.
  while (doAgain == true) {
    stdout.write("식단표 출력 프로그램 - 날짜를 입력하세요 :");
    dayInput = stdin.readLineSync(); // 날짜입력

    // 날짜 예외처리1. 입력한 날짜에 값이 존재하는가?
    if (foods.containsKey(dayInput) == true) {
      // 날짜 예외처리2. 입력한 날짜의 식단표 내용이 "휴무일"인가?
      if (foods[dayInput] == "휴무일") {
        stdout.writeln("식단표 출력 프로그램 - 급식이 진행하지 않는 날입니다.");
      } else {
        stdout.writeln("식단표 출력 프로그램 - $dayInput의 식단표 : ${foods[dayInput]}");
      }
    } else {
      stdout.writeln("식단표 출력 프로그램 - 급식이 존재하지 않는 날입니다.");
    }

    stdout.write("식단표 출력 프로그램 - 이어서 출력할까요? :");
    doAgainInput = stdin.readLineSync(encoding: utf8); // "네" 또는 "아니오" 를 입력

    if (doAgainInput == "아니오") {
      doAgain = false;
    } else {
      doAgain = true;
    }
  }

  stdout.writeln("프로그램을 종료합니다.");
}
