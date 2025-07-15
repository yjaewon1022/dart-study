import 'dart:io';
import 'dart:convert';

Future main() async {
  var serverIp = InternetAddress.loopbackIPv4.host;
  var serverPort = 3000;
  var serverPath;

  var httpClient = HttpClient();
  var httpResponseContent;
  var httpContent;

  HttpClientRequest httpRequest;
  HttpClientResponse httpResponse;

  print("|<- POST JSON Format");
  Map jsonContent = {'Korea': 'Seoul', 'Japan': 'Tokyo', 'China': 'Beijing'};
  var content = jsonEncode(jsonContent);

  serverPath = '/';
  httpRequest = await httpClient.get(serverIp, serverPort, serverPath)
    ..headers.contentType = ContentType.json
    ..headers.contentLength = content.length
    ..write(content);
  httpResponse = await httpRequest.close();
  httpResponseContent = await utf8.decoder.bind(httpResponse).join();
  printHttpContentInfo(httpResponse, httpResponseContent);
}

void printHttpContentInfo(var httpResponse, var httpResponseContent) {
  print("|<- status-code    : ${httpResponse.statusCode}");
  print("|<- content-type   : ${httpResponse.headers.contentType}");
  print("|<- content-length : ${httpResponse.headers.contentLength}");
  print("|<- content        : $httpResponseContent");
}
