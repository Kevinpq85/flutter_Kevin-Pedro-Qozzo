import 'package:flutter/cupertino.dart';
import 'model.dart';

class ContactEvents with ChangeNotifier {
  final List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;


  void addContact(Contact contact){
    _contacts.add(contact);
    _contacts.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void deleteContact(int i){
    _contacts.removeAt(i);
    notifyListeners();
  }
}