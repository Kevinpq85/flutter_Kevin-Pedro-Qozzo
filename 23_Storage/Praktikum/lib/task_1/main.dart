import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_23/task_2/stores/contact.dart' as contact_store;

import 'home_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => contact_store.Contact(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter",
      home: HomePage(),
    );
  }
}
