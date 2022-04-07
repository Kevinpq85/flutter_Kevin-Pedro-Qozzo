import 'package:flutter/material.dart';
import 'package:s_21/task_1/UI/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S21"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Ini adalah halama utama")],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ContactScreen(),
              ));
        },
      ),
    );
  }
}
