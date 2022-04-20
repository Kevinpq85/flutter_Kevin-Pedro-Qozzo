import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_25/screen/contact/menu_view_model.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<MenuViewModel>(context, listen: false).getAllMenus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<MenuViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
        ),
        body: ListView.builder(
          itemCount: modelView.menus.length,
          itemBuilder: (context, index) {
            final menu = modelView.menus[index];
            return ListTile(
              title: Text(menu.name),
            );
          },
        ));
  }
}
