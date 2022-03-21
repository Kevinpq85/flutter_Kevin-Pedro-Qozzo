import 'package:section/task_2/alterra_academy.dart';
import 'package:section/task_2/flutter_asik.dart';
import 'package:section/task_2/my_name.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Barcode(),
    );
  }
}

class Barcode extends StatefulWidget {
  const Barcode({Key? key}) : super(key: key);

  @override
  _BarcodeState createState() => _BarcodeState();
}

class _BarcodeState extends State<Barcode> {
 int currentIndex = 0;
  final List<Widget> body = [
    const AlteraAcademy(),
    const FlutterAsik(),
    const NamePage(),
  ];


  void _onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode'),
      ),
      body: body[currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.radar_rounded),
            label: 'Alterra Academy', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'Flutter asik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face_sharp),
            label: 'My Name'
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        onTap: _onTap,
      ),
    );
  }
}
