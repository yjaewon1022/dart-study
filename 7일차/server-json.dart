import 'dart:io';
import 'dart:convert';

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

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);

  printHttpServerActivated(server);

  await for (HttpRequest request in server) {
    printHttpRequestInfo(request);

    try {
      var content = await utf8.decoder.bind(request).join();
      // jsonDecode -> 우리가 가지고 있는 데이터를 json 형태로 해독하겠다.
      // as Map -> 해독한 데이터를 그대로 Dart 에서 사용할 수 없으니, Map 형태로 변경해서 담겠다.
      var jsonData = jsonDecode(content) as Map;

      print("\> content     : $jsonData");
      print("\> jsonData['Korea'] is ${jsonData['Korea']} ");
      print("\> jsonData['Japan'] is ${jsonData['Japan']} ");
      print("\> jsonData['China'] is ${jsonData['China']} ");

      content = 'POST JSON ACCEPTED';
      request.response
        ..headers.contentType = ContentType('text', 'plain', charset: "utf-8")
        ..headers.contentLength = content.length
        ..statusCode = HttpStatus.ok
        ..write(content);

      await request.response.close();
    } catch (err) {
      print("예상하지 못한 에러가 발생했습니다.");
    }
  }
}
