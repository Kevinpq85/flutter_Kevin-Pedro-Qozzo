import 'package:flutter/material.dart';
import 'package:s_22/create_new_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Image img;
  Image imgDown = Image.asset(
    "assets/emyu.jpg",
    width: 100,
    height: 100,
    fit: BoxFit.cover,
  );
  Image imgUp = Image.asset(
    "assets/emyu.jpg",
    width: 250,
    height: 250,
    fit: BoxFit.cover,
  );
  @override
  void initState() {
    super.initState();
    img = imgUp;
  }

  // bool isBig = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animasi"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: img,
            onTapUp: (tap) {
              setState(() {
                img = imgDown;
              });
            },
            onTapDown: (tap) {
              setState(() {
                img = imgUp;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const CreateNewContact();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final tween =
                        Tween(begin: const Offset(0, 5), end: Offset.zero);
                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: const Text("Go to create new contact"),
          )
        ],
      )),
    );
  }
}
