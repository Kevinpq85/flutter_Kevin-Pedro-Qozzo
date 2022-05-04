import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/data/model.dart';
import 'package:task2/data/contact.dart';

class MyForm extends StatefulWidget {
  static String routeName = '/form';
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String name = '';
  String phoneNumber = '';
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactEvents>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak Baru'),
        leading: IconButton(
            onPressed: () {
              if (name.isNotEmpty || phoneNumber.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: const Text('batal menambahkan Kontak ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              },
                              child: const Text('Yes')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('No')),
                        ],
                      );
                    });
              } else {
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    label: Text('Nama'),
                    hintText: 'Input Nama'),
                controller: nameController,
                onChanged: (String value) {
                  name = value;
                },
                validator: (newValue) {
                  if (newValue == '' || newValue!.contains('  ')) {
                    return 'Tolong isi nama terlebih dahulu';
                  }
                  return null;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    icon: Icon(Icons.numbers),
                    label: Text('Nomor'),
                    hintText: 'Input Nomor'),
                controller: phoneNumberController,
                onChanged: (String value) {
                  phoneNumber = value;
                },
                validator: (newValue) {
                  if (int.tryParse(newValue!) == null ||
                      newValue.contains('  ') ||
                      newValue.length < 10 ||
                      newValue.length > 13) {
                    return 'Tolong isi nomor terlebih dahulu';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    if (contactProvider.contacts
                        .any((element) => element.phoneNumber == phoneNumber)) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'Kontak dengan nomor $phoneNumber sudah pernah ditambahkan'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok')),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Tambah $name ke Kontak ?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      contactProvider.addContact(Contact(
                                          name: name,
                                          phoneNumber: phoneNumber));
                                      const snackBar = SnackBar(
                                          content: Text(
                                              'Kontak berhasih ditambahkan'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      Navigator.popUntil(
                                          context, (route) => route.isFirst);
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Batal')),
                              ],
                            );
                          });
                    }
                  },
                  child: const Text('Tambah Kontak')),
            ],
          ),
        ),
      ),
    );
  }
}
