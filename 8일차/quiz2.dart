import 'dart:io';

Future main() async {
  Map users = {"user001": "김희철", "user002": "유재석"};

  Map library = {
    "001": "차라투스트라는 이렇게 말했다.",
    "002": "용의자 X 의 헌신",
    "003": "정의란 무엇인가",
    "004": "존재와 시간",
    "005": "죽음의 수용소에서",
  };

  Map rentalStatus = {
    "001": null,
    "002": null,
    "003": null,
    "004": null,
    "005": null,
  };

  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 3000);
  print('\$ Server running at http://${server.address.address}:${server.port}');

  await for (HttpRequest request in server) {
    final segments = request.uri.pathSegments;

    // 경로: /library/rental/{책ID}/{사용자ID}
    if (request.method == 'POST' &&
        segments.length == 4 &&
        segments[0] == 'library' &&
        segments[1] == 'rental') {
      final bookId = segments[2];
      final userId = segments[3];
      await handleRental(request, users, library, rentalStatus, bookId, userId);
    }
    // 경로: /library/return/{책ID}/{사용자ID}
    else if (request.method == 'POST' &&
        segments.length == 4 &&
        segments[0] == 'library' &&
        segments[1] == 'return') {
      final bookId = segments[2];
      final userId = segments[3];
      await handleReturn(request, users, library, rentalStatus, bookId, userId);
    } else {
      // 지원하지 않는 경로
      request.response
        ..statusCode = HttpStatus.notFound
        ..write('지원하지 않는 경로입니다.')
        ..close();
    }
  }
}

Future<void> handleRental(
  HttpRequest request,
  Map users,
  Map library,
  Map rentalStatus,
  String bookId,
  String userId,
) async {
  String content;

  if (!users.containsKey(userId)) {
    content = '등록되지 않은 사용자입니다.';
    request.response.statusCode = HttpStatus.forbidden;
  } else if (!library.containsKey(bookId)) {
    content = '존재하지 않는 도서입니다.';
    request.response.statusCode = HttpStatus.notFound;
  } else if (rentalStatus[bookId] != null) {
    content = '이미 대여 중인 도서입니다.';
    request.response.statusCode = HttpStatus.conflict;
  } else if (rentalStatus.containsValue(userId)) {
    // 이미 다른 책을 대여 중인지 확인
    content = '이미 도서를 대여 중입니다. 한 사용자는 한 권의 책만 대여할 수 있습니다.';
    request.response.statusCode = HttpStatus.conflict;
  } else {
    rentalStatus[bookId] = userId;
    content = '${users[userId]}님이 "${library[bookId]}" 도서를 대여하였습니다.';
    request.response.statusCode = HttpStatus.ok;
  }

  request.response
    ..headers.contentType = ContentType.text
    ..write(content)
    ..close();
}

Future<void> handleReturn(
  HttpRequest request,
  Map users,
  Map library,
  Map rentalStatus,
  String bookId,
  String userId,
) async {
  String content;

  if (!users.containsKey(userId)) {
    content = '등록되지 않은 사용자입니다.';
    request.response.statusCode = HttpStatus.forbidden;
  } else if (!library.containsKey(bookId)) {
    content = '존재하지 않는 도서입니다.';
    request.response.statusCode = HttpStatus.notFound;
  } else if (rentalStatus[bookId] != userId) {
    content = '본인이 대여하지 않은 도서이거나 이미 반납된 도서입니다.';
    request.response.statusCode = HttpStatus.forbidden;
  } else {
    rentalStatus[bookId] = null;
    content = '${users[userId]}님이 "${library[bookId]}" 도서를 반납하였습니다.';
    request.response.statusCode = HttpStatus.ok;
  }

  request.response
    ..headers.contentType = ContentType.text
    ..write(content)
    ..close();
}
