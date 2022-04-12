import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_23/task_2/model.dart';
import 'package:s_23/task_2/stores/contact.dart' as contact_store;
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // simpanData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("namaUser", nameController.text.toString());
  //   pref.setString("noTelp", phoneNumberController.text.toString());
  // }
  late SharedPreferences pref;
  late String name = '';
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
                // setNotesData(phoneNumberController.text);
                if (!formKey.currentState!.validate()) return;

                formKey.currentState!.save();

                contactProvider
                    .add(GetContact(name: name, phoneNumber: phoneNumber));
                simpanData();
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

  simpanData() async {
    pref = await SharedPreferences.getInstance();
    pref.setString("text", nameController.text.toString());
    setState(() {
      name = pref.getString("text")!;
    });
  }
}
