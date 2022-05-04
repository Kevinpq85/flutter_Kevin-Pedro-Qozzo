import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/data/contact.dart';
import 'package:task2/pages/form.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<ContactEvents>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, MyForm.routeName);
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: contactProvider.contacts.isEmpty
            ? const Center(child: Text('Contact is empty'))
            : ListView.separated(
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        contactProvider.contacts[i].name[0].toUpperCase(),
                        style:
                            const TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ),
                    title: Text(contactProvider.contacts[i].name),
                    subtitle: Text(contactProvider.contacts[i].phoneNumber),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'Hapus ${contactProvider.contacts[i].name} dari Kontak ?'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          contactProvider.deleteContact(i);
                                          Navigator.of(context).pop();
                                          const snackBar = SnackBar(
                                              content: Text(
                                                  'Kontak Berhasil Dihapus'));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        },
                                        child: const Text('Hapus',
                                            style:
                                                TextStyle(color: Colors.red))),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Batal')),
                                  ],
                                );
                              });
                        },
                        icon: const Icon(Icons.delete)),
                  );
                },
                separatorBuilder: (context, i) {
                  return Divider(
                    color: Colors.grey[600],
                    thickness: 0,
                    height: 0,
                  );
                },
                itemCount: contactProvider.contacts.length),
      ),
    );
  }
}
