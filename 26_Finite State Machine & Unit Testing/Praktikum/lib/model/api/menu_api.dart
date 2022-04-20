import 'package:dio/dio.dart';
import 'package:s_25/model/menu_model.dart';

class MenuAPI {
  Future<List<Menu>> getMenu() async {
    final response = await Dio().get(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods",
    );

    List<Menu> contacts = (response.data as List)
        .map((e) => Menu(id: e['id'], name: e['name']))
        .toList();
    return contacts;
  }

  getAllMenu() {}
}
