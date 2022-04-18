import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/model/contact_model.dart';
import 'package:task1/screen/contact/contact_screen.dart';
import 'package:task1/screen/contact/contact_view_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('Create Contact')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Nama Kontak',
                    border: OutlineInputBorder(),
                    hintText: 'Nama Kontak'),
                validator: (value) {
                  if (value!.isNotEmpty && value.length < 4) {
                    return 'Masukkan setidaknya 4 karakter';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _numberController,
                decoration: const InputDecoration(
                    labelText: 'Nomor Kontak',
                    border: OutlineInputBorder(),
                    hintText: 'Nomor Kontak'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isNotEmpty && value.length < 4) {
                    return 'Masukkan setidaknya 4 karakter';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text('Tambah Kontak'),
                                content: const Text(
                                    'Apakah kamu mau menambah kontak ini?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Batal'),
                                    child: const Text('Batal'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      contactProvider.addContacts(Contact(
                                          name: _nameController.text,
                                          phone: _numberController.text));
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ContactScreen(),
                                          ),
                                          (route) => false);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ));
                    },
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}
