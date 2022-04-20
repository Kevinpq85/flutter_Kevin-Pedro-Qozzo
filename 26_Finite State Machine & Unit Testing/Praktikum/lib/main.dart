import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_25/screen/contact/menu_view_model.dart';

import 'screen/contact/menu_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MenuViewModel())],
    child: const MaterialApp(
      home: MenuScreen(),
    ),
  ));
}
