import 'package:dio/dio.dart';
import 'package:task1/model/contact_model.dart';

class ContactAPI {
  static Future<List<Contact>> getContacts() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts");
    List<Contact> contacts = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
        .toList();
    return contacts;
  }

  static Future<Contact> setContacts(Contact data) async {
    final response = await Dio().post(
      "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts",
      data: data.toJson(),
    );
    if (response.data['affectedRows'] > 0) {
      data.id = response.data['values']['insertId'];
    }
    return data;
  }

  static Future<bool> editContacts(int id, Contact data) async {
    final response = await Dio().put(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/$id',
      data: data.toJson(),
    );
    if (int.parse(response.data['affectedRows']) > 0) {
      return true;
    }
    return false;
  }

  static Future<bool> deleteContacts(int id) async {
    final response = await Dio().delete(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts$id');
    if (response.data['affectedRows'] > 0) {
      return true;
    }
    return false;
  }
}
