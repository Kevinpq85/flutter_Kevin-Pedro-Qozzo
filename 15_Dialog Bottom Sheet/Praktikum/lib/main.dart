import 'package:flutter/material.dart';
import 'package:flutter_gellary/gallery.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Galeery',
      home: Gallery(),
    );
  }
}
