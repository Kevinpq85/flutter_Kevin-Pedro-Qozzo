import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_post2/model/contact_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'JSON Parsing',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Contact>? _contacts;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  void _fetchContacts() async {
    Dio().get(
        'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) {
            print('status: $status');
            return status! < 500;
          },
          contentType: 'application/json',
          maxRedirects: 5,
          method: 'GET',
          receiveTimeout: 5000,
          sendTimeout: 5000,
          receiveDataWhenStatusError: true,
        ), onReceiveProgress: (
      received,
      total,
    ) {
      print('Received: ${received.toString()}');
      print('Total: ${total.toString()}');
    },
        cancelToken: CancelToken(),
        queryParameters: {'page': 1, 'limit': 10}).then((response) {
      if (kDebugMode) {
        print(response);
      }
      setState(() {
        _contacts = response.data
            .map<Contact>((json) => Contact.fromJson(json))
            .toList();
      });
    });
  }

  void _addContact(Contact contact) async {
    Dio().post(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
      data: {
        'id': contact.id,
        'name': contact.name,
        'phone': contact.phone,
      },
    ).then((response) {
      if (kDebugMode) {
        print(response);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Parsing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchContacts,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _contacts?.length ?? 0,
        itemBuilder: (context, index) {
          final contact = _contacts?.elementAt(index);
          String name = contact?.name ?? 'No name';
          String phone = contact?.phone ?? 'No phone';
          return ListTile(
            leading: CircleAvatar(
              child: Text(name.substring(0, 1)),
            ),
            title: Text(name),
            subtitle: Text(phone),
            trailing: InkWell(
              onTap: () {
                setState(() {
                  _contacts?.removeAt(index);
                });
              },
              child: const Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Contact'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        controller: _phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _contacts?.add(Contact(
                                    id: DateTime.now().millisecondsSinceEpoch,
                                    name: _nameController.text,
                                    phone: _phoneController.text,
                                  ));
                                });
                                _addContact(Contact(
                                  id: DateTime.now().millisecondsSinceEpoch,
                                  name: _nameController.text,
                                  phone: _phoneController.text,
                                ));
                              }
                              _nameController.clear();
                              _phoneController.clear();
                              Navigator.pop(context);
                            },
                            child: const Text('Add Contact'),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              _nameController.clear();
                              _phoneController.clear();
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.red),
                            ),
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
