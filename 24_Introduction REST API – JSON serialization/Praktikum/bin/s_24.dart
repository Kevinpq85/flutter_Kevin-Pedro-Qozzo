import 'package:dio/dio.dart';
import 'dart:convert';

void main() {
  Dio()
      .post(
          "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts")
      .then((response) {
    print(response);
  });
}

// void main() {
//   var dataJson = '{"id": 2, "name": "John Thor", "phone": "0857676565688"}';
//   var dataMap = jsonDecode(dataJson);
//   print(dataMap);
// }
