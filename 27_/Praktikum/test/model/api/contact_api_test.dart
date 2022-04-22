import 'package:flutter_test/flutter_test.dart';
import 'package:s_27/model/api/contact_api.dart';

void main() {
  test('contact api ...', () async {
    var contacts = await ContactAPI.getContacts();
    expect(contacts.isNotEmpty, true);
  });
}
