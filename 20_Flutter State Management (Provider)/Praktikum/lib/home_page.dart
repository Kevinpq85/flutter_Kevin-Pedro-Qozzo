import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_20/model.dart';
import 'package:s_20/stores/contact.dart' as contact_store;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String phoneNumber = '';
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Contact")),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              onChanged: (String value) {
                name = value;
              },
            ),
            TextField(
              controller: phoneNumberController,
              onChanged: (String value) {
                phoneNumber = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (!formKey.currentState!.validate()) return;

                formKey.currentState!.save();

                contactProvider
                    .add(GetContact(name: name, phoneNumber: phoneNumber));
              },
              child: const Text("Tambah Nomor"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: contactProvider.contacts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(contactProvider.contacts[index].name),
                        subtitle:
                            Text(contactProvider.contacts[index].phoneNumber),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
