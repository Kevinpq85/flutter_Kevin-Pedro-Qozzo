import 'package:dio/dio.dart';

Dio dio = Dio();
Future getContact() async {
  var response = await dio
      .get(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2')
      .then((response) {
    print(response.data);
  });
}

void main() {
  print(getContact());
}
