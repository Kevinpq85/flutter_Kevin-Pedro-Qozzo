import 'package:flutter/material.dart';

import 'create_contact.dart';

class Person {
  String name;
  String number;

  Person(this.name, this.number);
}

// ignore: camel_case_types
class task1 extends StatelessWidget {
  task1({Key? key}) : super(key: key);

  final List<Person> contact = [
    Person('Aceng', '08696948458'),
    Person('Asep', '08242765633'),
    Person('Betok', '08488433828'),
    Person('Alwan', '08998984439'),
    Person('Maul', '08696969699'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen Contact"),
        ),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return const newcontacts();
                  }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                    final tween = Tween(begin: 0.0, end: 2.0);
                    return FadeTransition(
                        opacity: animation.drive(tween), child: child);
                  }),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final user = contact[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0]),
              ),
              onTap: () {},
              title: Text(
                user.name,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                user.number,
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
          itemCount: contact.length,
        ),
      )),
    );
  }
}
