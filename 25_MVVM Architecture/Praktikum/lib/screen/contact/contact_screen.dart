import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/screen/contact/contact_view_model.dart';
import 'package:task1/screen/create/create_contact.dart';
import 'package:task1/screen/edit/edit_screen.dart';

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
        title: const Text('Contacts'),
      ),
      body: ListView.builder(
          itemCount: modelView.contacts.length,
          itemBuilder: (context, index) {
            final contact = modelView.contacts[index];
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person_rounded),
              ),
              title: Text(contact.name),
              subtitle: Text(contact.phone),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Hapus Kontak'),
                              content: const Text(
                                  'Apakah kamu mau menghapus kontak ini?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Batal'),
                                  child: const Text('Batal'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      modelView.deleteContacts(contact.id!);
                                      Navigator.pop(context, 'Ya');
                                    },
                                    child: const Text('Ya')),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete_forever_rounded)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                        id: contact.id!,
                        name: contact.name,
                        phone: contact.phone),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
        },
        child: const Icon(Icons.person_add_outlined),
      ),
    );
  }
}
