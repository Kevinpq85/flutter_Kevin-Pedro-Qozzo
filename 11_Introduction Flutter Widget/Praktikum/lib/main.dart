import 'package:flutter/material.dart';
import 'dart:async';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FlutterTimeDemo(),
    );
  }
}

class FlutterTimeDemo extends StatefulWidget{
  const FlutterTimeDemo({Key? key}) :super(key: key);

  @override
  _FlutterTimeDemoState createState() => _FlutterTimeDemoState();

}

class _FlutterTimeDemoState extends State<FlutterTimeDemo>
{
  late String _timeString;

  @override
  void initState(){
    _timeString = "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";
    Timer.periodic(const Duration(seconds: 1), (Timer t) =>_getCurrentTime());
    super.initState();
  }

@override 
Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(title: const Text('Flutter Timer'),),
    body: Center(
      child: Text(_timeString, style: const TextStyle(fontSize: 30),),
      ),
    );
  }

void _getCurrentTime(){
    setState(() {
  _timeString = "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";
    });
  }
}