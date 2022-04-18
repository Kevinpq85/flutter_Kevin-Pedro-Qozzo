import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/model/contact_model.dart';
import 'package:task1/screen/contact/contact_screen.dart';
import 'package:task1/screen/contact/contact_view_model.dart';

class EditScreen extends StatefulWidget {
  int id;
  String name;
  String phone;
  EditScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.phone,
  }) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
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
  void initState() {
    _nameController.text = widget.name;
    _numberController.text = widget.phone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kontak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(253, 0, 140, 255)),
                  child: const Icon(
                    Icons.person_rounded,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 10),
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
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Tambah kontak'),
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
                                    var _contact = Contact(
                                        name: _nameController.text,
                                        phone: _numberController.text);
                                    contactProvider.editContacts(
                                        widget.id, _contact);
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
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
