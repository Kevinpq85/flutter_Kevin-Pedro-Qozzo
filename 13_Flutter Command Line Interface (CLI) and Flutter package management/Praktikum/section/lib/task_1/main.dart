import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Column(
      children: [
        Center(
          child: Column(
            children: [
              const Chip(
      padding: EdgeInsets.all(0),
      backgroundColor: Colors.deepPurple,
      label: Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
    Badge(
      toAnimate: false,
      shape: BadgeShape.square,
      badgeColor: Colors.deepPurple,
      borderRadius: BorderRadius.circular(8),
      badgeContent: const Text('BADGE', style: TextStyle(color: Colors.white)),
    ),
      ],
      ),
      )
    ]
    )
    );
  }
}
  