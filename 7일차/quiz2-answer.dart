// localhost:8080 으로 접근할 수 있는 서버를 생성하고,
// 크롬 검색창에서 localhost:8080/country=Korea 과 같이 입력했을 때,
// 다음과 같이 출력이 되는 기능을 만드세요.
// [Korea의 수도는 Seoul 입니다.]
// 단, 나라가 입력되지 않은 경우는 다음과 같이 출력되어야 합니다.
// [유효하지 않은 나라를 입력하셨습니다.]

import 'dart:convert';
import 'dart:io';

Future main() async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };

  // HttpServer.bind 라는 기능으로 이용할 서버를 만들거야.
  // 서버를 생성, 실행시키는 방법 : HttpServer.bind(사용할IP주소, 포트번호);
  // InternetAddress.loopbackIPv4 = "127.0.0.1"
  // 통상적으로 127.0.0.1 IP주소는 현재 내 컴퓨터의 기본 주소로 사용이 됨.
  // localhost 는 127.0.0.1 을 의미함
  // HttpServer.bind 는 비동기 함수 입니다.
  // 그래서 server 변수에 값이 들어가기도 전에, printHttpServerActivated가 실행이 됩니다.
  // 이를 대처하기 위해서는 비동기 함수 앞에 await를 작성해서
  // 다음 코드로 넘어가지 않게 대처를 해주어야 합니다.
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);

  printHttpServerActivated(server);

  // 서버는 사용자로부터 요청(request)이 있어야, 응답(response)을 줄 수 있음
  // 사용자에게 받은 요청을 처리하는 부분
  // for : 서버에 사용자가 준 모든 요청(request) 에 대응하기 위한 반복문
  // HttpRequest : 실제 사용자가 보내는 요청을 뜻하는 타입
  // request : 타입을 담을 변수
  // in server : 서버 내에서 반복문을 계속 돌리겠다
  await for (HttpRequest request in server) {
    // 사용자의 요청에 대한 응답 처리를 진행하는 부분 작성
    // .uri : 사용자가 보낸 요청에 대한 주소. 주소는 서버의 주소를 뜻함. 즉 127.0.0.1:8080/
    // .path : 주소에 대한 경로. 경로는 사용자가 요청한 주소에서
    //         서버의 IP주소와 포트번호를 제외한 나머지 문자열. 즉 /

    if (request.uri.path == "/") {
      // 나는 주소창에 127.0.0.1:8080 만 작성을 했는데, 왜 / 를 넣은 if 문이 동작했지?
      // 그 이유는 기본적으로 우리가 / 를 작성해주지 않더라도 컴퓨터가 자동으로 / 를 넣어줌
    }
    // 퀴즈 내용인 /country=Korea 를 입력했을 때 우리가 가지고 있는 Map 변수인
    // country 변수에 있는 나라에 맞는 수도를 출력하는 프로그램을 만들어보자!
    // 사용자의 요청이 /country 로 보낸 것인지 확인부터 해보자!
    // request.uri.path 즉 사용자가 요청한 경로에 /country 라는 문자열이 있는지 확인
    // contains : 문자열.contains(확인할 내용) 문자열에 contains 이후에 작성된
    // 확인할 내용이 있는지 에 대한 true, false 값을 반환하는 기능
    else if (request.uri.path.contains("/country")) {
      // country=Korea 에서 Korea 만 추출하는 기능을 구현해보자!
      var name = request.uri.path.split("="); // [/country, Korea]

      // name 에서 Korea 만 가져올거야.
      var input = name[1]; // Korea 만 가져온 값을 input 변수에 저장

      // 이제 country 변수에서 사용자가 입력한 나라가 있으면 그 나라의 수도를 출력하는 부분
      // 을 만들어보자
      if (country.containsKey(input)) {
        // print(country[input]);
        var sudo = country[input]; // sudo 라는 변수에 결괏값을 넣어서 보기 편하게 변경

        var result = utf8.encode("$input의 수도는 $sudo 입니다.");

        // 사용자의 요청에 대한 실제 응답 전달 부분 구현
        // request.response : 사용자가 보낸 요청에 대한 응답
        // statusCode : 이 응답에 대한 상태
        // headers.contentType : 응답에서 사용자에게 전해줄 데이터의 타입
        // headers.contentLength : 응답에서 사용자에게 전해줄 데이터의 길이
        // write : 앞서 작성한 내용대로 사용자에게 응답을 보내겠다.
        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
          ..headers.contentLength = result.length
          ..add(result);

        // // .. 이 어떤 역할을 하는가?
        // // 중복되는 코드들을 한 번에 묶어서 사용할 수 있게 해주는 문법
        // request.response.statusCode = HttpStatus.ok;
        // request.response.headers.contentType = ContentType('text', 'plain', charset: 'utf-8');
        // request.response.headers.contentLength = sudo;
        // request.response.write(sudo);
      } else {
        var result = utf8.encode("유효하지 않은 나라를 입력하셨습니다.");

        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
          ..headers.contentLength = result.length
          ..add(result);
      }
    }

    // 항상 사용자의 요청에 대한 응답을 write 하고 난 뒤에는,
    // 이 응답은 이렇게 끝내겠다 라고 하는 "response 를 닫는 기능"을 작성해줘야 합니다.
    await request.response.close();
  }
}

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}
