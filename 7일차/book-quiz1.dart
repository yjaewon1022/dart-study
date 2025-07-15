import 'dart:io';

Future main() async {
  var ip = InternetAddress.loopbackIPv4;
  var port = 3000;

  var server = await HttpServer.bind(ip, port);

  print("\$ server activated - ${server.address.address}:${server.port}");

  await for (HttpRequest request in server) {
    try {
      if (request.uri.path.contains('/dan')) {
        // request 에 따른 기능 구현

        var varList = request.uri.path.split(',');
        var dan = int.parse(varList[1]);
        var result;

        // // 1 ~ 9 까지 곱하기 기능을 write 해야한다.
        // for (var i = 1; i <= 9; i++) {
        // }

        // 응답 작성
        request.response.statusCode = HttpStatus.ok;
        request.response.write("""
$dan x 1 = ${dan * 1}
$dan x 2 = ${dan * 2}
$dan x 3 = ${dan * 3}
$dan x 4 = ${dan * 4}
$dan x 5 = ${dan * 5}
$dan x 6 = ${dan * 6}
$dan x 7 = ${dan * 7}
$dan x 8 = ${dan * 8}
$dan x 9 = ${dan * 9}
""");
      }

      // 우리는 사용자가 요청한 내용에 대한 응답을 전부 다 썼으니, 이 연결을 종료할게
      await request.response.close();
    } catch (error) {
      print("에러 발생!");
    }
  }
}
