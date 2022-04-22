import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_27/screen/contact/contact_view_model.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: ListView.builder(
          itemCount: modelView.contacts.length,
          itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
              title: Text(contact.name),
              subtitle: Text(contact.phone),
            );
          }),
    );
  }
}
