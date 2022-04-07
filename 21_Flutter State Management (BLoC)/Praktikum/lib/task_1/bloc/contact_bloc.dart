import 'dart:async';
import 'package:s_21/models/contact.dart';

class ContactBloc {
  List<Contact> _contactList = [
    Contact("Kevin", "0899988888", "assets/emyu.jpg"),
    Contact("Alwan", "0899988888", "assets/emyu.jpg"),
    Contact("Bangkur", "0899988888", "assets/emyu.jpg"),
    Contact("Aceng", "0899988888", "assets/emyu.jpg"),
    Contact("Suep", "0899988888", "assets/emyu.jpg"),
  ];
  final _contactListStreamController = StreamController<List<Contact>>();
  final _deleteTapStreamController = StreamController<Contact>();

  Stream<List<Contact>> get contactListStream =>
      _contactListStreamController.stream;
  StreamSink<List<Contact>> get contactLisSink =>
      _contactListStreamController.sink;
  StreamSink<Contact> get deleteTapSink => _deleteTapStreamController.sink;

  ContactBloc() {
    _contactListStreamController.add(_contactList);
    _deleteTapStreamController.stream.listen(_onTapDelete);
  }

  _onTapDelete(Contact contact) {
    _contactList.remove(contact);

    contactLisSink.add(_contactList);
  }

  void dispose() {
    _contactListStreamController.close();
    _deleteTapStreamController.close();
  }
}
