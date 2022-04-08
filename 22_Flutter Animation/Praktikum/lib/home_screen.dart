import 'package:flutter/material.dart';
import 'package:s_22/create_new_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isBig = false;
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
            onTap: () {
              setState(() {
                isBig = !isBig;
              });
            },
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  "assets/emyu.jpg",
                  fit: BoxFit.cover,
                  width: isBig ? 100 : 500,
                  height: isBig ? 100 : 500,
                )),
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
