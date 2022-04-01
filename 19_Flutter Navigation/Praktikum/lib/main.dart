import 'package:dojo/pages/create_new_contacts.dart';
import 'package:dojo/pages/home.dart';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/newContacts': (context) => CreateNewContact()
      },
    ));
