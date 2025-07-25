// 기존에 학습했던 http 코드들을 참고하여 사용자를 CRUD 할 수 있는 RESTful 프로그램을 작성하고자 합니다.
// 다음의 코드들을 참고하여 RESTful 프로그램을 완성하세요.
// 서버의 포트는 3000번 포트를 이용하며,
// 각 API들은 /user 를 이용하여 호출이 되어야 합니다.

import 'dart:convert';
import 'dart:io';

void create(Map database, HttpRequest request) async {
  // 생성 코드 작성
  // 1. 사용자가 요청한 값을 문자열로 변환하는 기능을 만들자!
  //    (request 로 서버에게 전달된 값은 일반 사람이 읽을 수 없는 Stream 데이터로 받아옴)
  //    (그래서, 이걸 서버에서 실제 값을 확인할 수 있게 문자열로 변환하는 기능을 구현해야 함)
  var bodyData = await utf8.decoder.bind(request).join();

  // json 데이터를 우리가 사용할 수 있는 Map 타입으로 변경을 해서 사용해야 함
  var mapData = jsonDecode(bodyData) as Map;

  // 사용자에게 받은 값을 key 와 value 로 분리하여 우리의 실제 database에 저장을 해보자!
  var key, value;

  // map에서 key 0001 과 value 홍길동을 추출해보자
  mapData.forEach((k, v) {
    key = k;
    value = v;
  });

  // DB에 사용자가 입력한 값을 실제로 추가해보자
  // 근데 추가할 때 같은 키로 데이터를 추가하면 어떻게 되는거지?
  // 우리는 수정, 조회, 삭제 등등을 할 때 키로 데이터를 확인하는데,
  // 같은 키를 가진 데이터가 있으면 컴퓨터는 어떤 데이터를 삭제해야할지 모르게 됨
  // 그래서 생성하려는 키가 이미 있으면 생성을 하지 못하게 예외처리를 진행해야 함

  // /* 키가 이미 존재하는지 에 대한 조건문 처리 방법 */
  if (database.containsKey(key)) {
    // 이미 키가 있는 경우
    bodyData = "생성 실패! 이미 존재하는 키 입니다!";
  } else {
    // 키가 없는 경우
    // database 변수의 key 값과 value 값으로 이루어진 데이터를 넣겠다.
    database[key] = value;
    bodyData = "생성 성공!";
  }

  // /* 키가 존재하지 않는지 에 대한 조건문 처리 방법 */
  // database.containsKey(key) 는 true 또는 false 값을 반환함
  if (database.containsKey(key) == false) {
    // 키가 없는 경우
  } else {
    // 키가 있는 경우
  }

  printAndSendHttpResponse(database, request, bodyData);
}

void read(Map database, HttpRequest request) async {
  // 조회 코드 작성
  // url에 있는 사용자가 입력해준 사용자ID 값을 가져와야 함
  var key;
  // request.uri : 사용자가 요청한 url
  // pathSegments : 127.0.0.1:3000/user/0001 에서 ip주소와 포트번호를 제외한 이후 데이터를
  //                / 로 나누어서 [] List 안에 작성해놓은 것
  //                ["user","0001"]
  key = request.uri.pathSegments.last;

  var content; // 사용자에게 response 로 전달될 데이터가 담길 변수

  if (database.containsKey(key)) {
    // 실제 database 에 있는 값을 사용자에게 response 로 전달
    content = "조회 성공! 조회한 데이터는 ${database[key]} 입니다.";
  } else {
    // 데이터가 없는 경우
    content = "조회 실패! 조회할 데이터가 존재하지 않습니다!";
  }

  printAndSendHttpResponse(database, request, content);
}

void update(Map database, HttpRequest request) async {
  var content = await utf8.decoder.bind(request).join();
  var transaction = jsonDecode(content) as Map;
  var key, value;

  print("\> content        : $content");

  transaction.forEach((k, v) {
    key = k;
    value = v;
  });

  if (database.containsKey(key) == true) {
    database[key] = value;
    content = "요청 성공 < $transaction updated >";
  } else {
    content = "요청 실패 < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

void delete(Map database, HttpRequest request) async {
  var key = request.uri.pathSegments.last;
  var content, value;

  if (database.containsKey(key) == true) {
    value = database[key];
    database.remove(key);
    content = "요청 성공 < {$key, $value} deleted >";
  } else {
    content = "요청 실패 < $key not-exist >";
  }
  printAndSendHttpResponse(database, request, content);
}

Future main() async {
  var database = <dynamic, dynamic>{};

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    if (request.uri.path.contains('/user') == true) {
      printHttpRequestInfo(request);

      try {
        switch (request.method) {
          // 메서드들에 대한 CASE 작성
          case "GET":
            // CRUD에서 READ 를 담당할 때 GET 사용
            read(database, request);
            break;
          case "PUT":
            // CRUD에서 UPDATE 를 담당할 때 PUT 사용
            update(database, request);
            break;
          case "POST":
            // CRUD에서 CREATE 를 담당할 때 PUT 사용
            create(database, request);
            break;
          case "DELETE":
            // CRUD에서 DELETE 를 담당할 때 PUT 사용
            delete(database, request);
            break;
          default:
            print("\$ 지원하지 않는 메서드입니다.");
            break;
        }
      } catch (err) {
        print("\$ 요청 수행 중 에러가 발생했습니다.");
      }
    } else {
      printAndSendHttpResponse(
        database,
        request,
        "${request.method} {에러: 지원하지 않는 API 입니다.}",
      );
    }
  }
}

void printHttpServerActivated(HttpServer server) {
  var ip = server.address.address;
  var port = server.port;

  print('\$ Server activated in $ip:$port');
}

void printHttpRequestInfo(HttpRequest request) async {
  var ip = request.connectionInfo!.remoteAddress.address;
  var port = request.connectionInfo!.remotePort;
  var method = request.method;
  var path = request.uri.path;

  print('\$ $method $path from $ip:$port');

  if (request.headers.contentLength != -1) {
    print('\> content-type: ${request.headers.contentType}');
    print('\> content-lendth: ${request.headers.contentLength}');
  }
}

void printAndSendHttpResponse(
  Map database,
  HttpRequest request,
  String content, // ${request.method} {에러: 지원하지 않는 API 입니다.}
) async {
  print("\$ $content \n current DB      : $database");

  var data = utf8.encode(content);
  // data 라는 변수에 content 에 있는 한글도 제대로 확인할 수 있게 변경

  request.response
    ..headers.contentType = ContentType('text', 'plain', charset: 'utf-8')
    ..headers.contentLength = data
        .length // 기존 코드 : content.length
    ..statusCode = HttpStatus.ok
    ..add(data); // 기존 코드 : ..write(content);

  await request.response.close();
}
