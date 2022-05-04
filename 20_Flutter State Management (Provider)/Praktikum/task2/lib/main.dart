import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/data/contact.dart';
import 'package:task2/pages/form.dart';
import 'package:task2/pages/home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ContactEvents(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        MyForm.routeName: (context) => const MyForm(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Phone Book App',
    );
  }
}
