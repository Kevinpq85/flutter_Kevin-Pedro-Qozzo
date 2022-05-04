import 'package:flutter/material.dart';

// ignore: camel_case_types
class newcontacts extends StatefulWidget {
  const newcontacts({Key? key}) : super(key: key);

  @override
  State<newcontacts> createState() => _newcontactsState();
}

// ignore: camel_case_types
class _newcontactsState extends State<newcontacts> {
  var inputController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          key: const ValueKey("create contacts"),
            appBar: AppBar(
              title: const Text("Create New Contacts"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Padding(
              key: const ValueKey("test create"),
              padding: const EdgeInsets.all(16),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextField(
                        controller: inputController,
                        decoration: const InputDecoration(
                            hintText: 'Type Contact Name Here...',
                            labelText: 'Name',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: inputController,
                        decoration: const InputDecoration(
                            hintText: 'Type Contact Phone Number Here...',
                            labelText: 'Number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 2))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
