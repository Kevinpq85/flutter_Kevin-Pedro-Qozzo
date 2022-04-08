import 'package:flutter/material.dart';

class CreateNewContact extends StatefulWidget {
  const CreateNewContact({Key? key}) : super(key: key);

  @override
  State<CreateNewContact> createState() => _CreateNewContactState();
}

class _CreateNewContactState extends State<CreateNewContact> {
  var inputController = TextEditingController();
  var inputController2 = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Contact")),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                TextField(
                  decoration: InputDecoration(
                      icon: const Icon(Icons.contacts),
                      labelText: "Nama",
                      hintText: "Input Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      )),
                  controller: inputController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      icon: const Icon(Icons.call),
                      labelText: "Nomor",
                      hintText: "Input Nomor",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                      )),
                  controller: inputController2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  width: 100,
                  height: 35,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    onPressed: () {},
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ])),
        ),
      ),
    );
  }
}
