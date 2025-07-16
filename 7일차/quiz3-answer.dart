// quiz2.dart 파일을 참고하여 다음의 기능들을 추가로 구현하세요.
// 1. GET 메서드를 사용해 모든 나라의 수도를 출력하는 기능을 구현하세요.
// 경로는 /all 이며,
// 반환되는 데이터는 JSON 형식이어야 합니다.
// 2. DELETE 메서드를 사용해 입력한 나라를 삭제하는 기능을 구현하세요.
// 경로는 /delete=나라이름 이며,
// 해당 데이터를 삭제한 후 남아있는 나라들을 반환해야 합니다.
// 반환되는 데이터는 JSON 형식이여야 합니다.

import 'dart:convert';
import 'dart:io';

void httpGetHandler(HttpRequest request) async {
  Map country = {
    "Korea": "Seoul",
    "Japan": "Tokyo",
    "China": "Beijing",
    "Canada": "Ottawa",
    "Austrailia": "Canberra",
  };

  if (request.uri.path == "/") {
  } else if (request.uri.path.contains("/country")) {
    var name = request.uri.path.split("="); // [/country, Korea]

    var input = name[1]; // Korea 만 가져온 값을 input 변수에 저장

    if (country.containsKey(input)) {
      // print(country[input]);
      var sudo = country[input]; // sudo 라는 변수에 결괏값을 넣어서 보기 편하게 변경

      var result = utf8.encode("$input의 수도는 $sudo 입니다.");

      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
        ..headers.contentLength = result.length
        ..add(result);
    } else {
      var result = utf8.encode("유효하지 않은 나라를 입력하셨습니다.");

      request.response
        ..statusCode = HttpStatus.ok
        ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
        ..headers.contentLength = result.length
        ..add(result);
    }
  } else if (request.uri.path.contains("/all")) {
    // 가지고 있는 country 변수의 값들을 JSON 타입으로 변환해보자.
    var content = jsonEncode(country);

    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.json
      ..headers.contentLength = content.length
      ..write(content);
  }
}

void httpDeleteHandler(HttpRequest request) async {}

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    // 사용자가 요청을 보낼 때 사용한 메서드에 따라서 각각 다른 함수가 동작할 수 있게 만들어보자.
    // switch(조건에 사용할 변수) {
    //   case '조건1': {}
    //   case '조건2': {}
    // }

    // request.method 라는 요청의 메소드에 따라서 다른 코드를 실행하겠다.
    switch (request.method) {
      case "GET":
        httpGetHandler(request);

        // case 내부의 코드가 다 동작했다면, break; 를 작성해서 "해당 case 에서 벗어나겠다."
        // 라는 내용을 반드시 작성해줘야 함.
        break;
      case "DELETE":
        break;
      // switch-case 문 이용시, case 들을 아무리 작성하더라도 몇 개 빠지거나,
      // case 들을 모두 만족하지 않는 경우가 존재할 수 있다.
      // 이에 대한 예외처리를 위한 default 라는 기능을 반드시 이용해주어야 한다.
      default:
        break;
    }

    await request.response.close();
  }
}

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}
