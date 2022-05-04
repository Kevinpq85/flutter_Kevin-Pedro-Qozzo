import 'package:flutter/cupertino.dart';
import 'package:flutter_telegram/task_2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Telegram',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
