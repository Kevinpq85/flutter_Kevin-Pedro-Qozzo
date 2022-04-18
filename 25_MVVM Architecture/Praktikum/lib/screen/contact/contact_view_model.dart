import 'package:flutter/cupertino.dart';
import 'package:task1/model/api/contact_api.dart';
import 'package:task1/model/contact_model.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    _contacts.sort(((a, b) => a.name.compareTo(b.name)));
    notifyListeners();
  }

  addContacts(Contact contact) async {
    final c = await ContactAPI.setContacts(contact);
    _contacts.add(c);
    notifyListeners();
  }

  editContacts(int id, Contact contact) async {
    final c = await ContactAPI.editContacts(id, contact);
    notifyListeners();
  }

  deleteContacts(int id) async {
    final c = await ContactAPI.deleteContacts(id);
    _contacts.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
