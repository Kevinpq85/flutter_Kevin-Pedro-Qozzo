import 'package:flutter/material.dart';
import 'package:task1/pages/form.dart';
import 'package:task1/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        MyForm.routeName: (context) => const MyForm()
      },
      debugShowCheckedModeBanner: false,
      title: 'Phone Book App',
    );
  }
}
