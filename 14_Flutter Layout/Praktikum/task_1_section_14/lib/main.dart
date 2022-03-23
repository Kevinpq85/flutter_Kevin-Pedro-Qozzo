import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListView1(),
    );
  }
}

class ListView1 extends StatelessWidget {
   ListView1({ Key? key }) : super(key: key);
  final List nama = [
    "Anggun",
    "Amel",
    "Asep",
    "Angel",
    "Mei",
    "Amor",
    "Disti",
    "Putri",
    "Fuji",
    "Silvi",
    "Neneng",
    "Zahra"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON ListView in Flutter"),
      ),
      body: ListView.builder(
  itemBuilder: (context, index) {
    return Card(
      child: ListTile(
          title: Text(
            nama[index], 
            style: const TextStyle(fontSize: 30)
          ),
          subtitle: const Text('Hi'),
          leading: CircleAvatar(
            child: Text(
              nama[index][0],
              style: const TextStyle(fontSize: 20)
            ),
          )
      ),
    );
  },
  itemCount: nama.length,
),
    );
  }
}

