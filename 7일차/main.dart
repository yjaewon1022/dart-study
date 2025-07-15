import 'dart:convert';
import 'dart:io';

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 4040;

  var server = await HttpServer.bind(ip, port);

  print("\$ server activated - ${server.address.address}:${server.port}");

  // server 에 존재하는 request 들에 대해서 계속해서 반복하여 내부 코드를 실행하겠다.
  await for (HttpRequest request in server) {
    // try-catch 구조 : try {} catch(error) {}
    // try 뒤에 있는 {} 의 내용을 실행하되, 해당 내용 실행 중 에러가 발생하면
    // catch 이후에 있는 {} 의 내용으로 바꿔서 실행해라.
    try {
      // http://127.0.0.1:4040/ 에서 ip와 port를 제외한 이후 문자열이 / 만 있는지
      // 확인하는 조건문
      // request.uri.path -> 위의 url 에서 http://127.0.0.1:4040 을 제외한 그 다음 문자열
      if (request.uri.path == '/') {
        print('\$ http response is "Hello, World!".');
        print('\$ send "200 OK".');

        request.response
          ..statusCode = HttpStatus.ok
          ..write("Hello, World!");
      } else if (request.uri.path.contains('/add')) {
        print('\$ http response is result of "add" operation.');
        print('\$ send "200 OK".');

        var varList = request.uri.path.split(',');
        var result = int.parse(varList[1]) + int.parse(varList[2]);

        request.response
          ..statusCode = HttpStatus.ok
          ..write("${varList[1]} + ${varList[2]} = $result");
      } else if (await File(request.uri.path.substring(1)).exists() == true) {
        // request.uri.path -> port 번호까지 다 지운 후 남아있는 텍스트. 즉 /sample.txt
        // .substring(1) -> 맨 앞에 있는 첫 번째 문자열을 제거하겠다. 즉 sample.txt
        print('\$ http response is "${request.uri.path}" file transfer.');
        print('\$ send "200 ok".');

        var file = File(request.uri.path.substring(1));
        var fileContent = await file.readAsString();

        request.response
          ..statusCode = HttpStatus.ok
          ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
          ..write(fileContent);
      }

      await request.response.close();
    } catch (error) {
      print("\$ 요청 수행 중 에러 발생: $error");
    }
  }
}
