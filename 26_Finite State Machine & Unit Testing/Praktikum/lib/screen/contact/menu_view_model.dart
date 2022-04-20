import 'package:flutter/cupertino.dart';
import 'package:s_25/model/api/menu_api.dart';
import 'package:s_25/model/menu_model.dart';

class MenuViewModel with ChangeNotifier {
  List<Menu> _menus = [];
  List<Menu> get menus => _menus;

  getAllMenus() async {
    final c = await MenuAPI().getMenu();
    _menus = c;
    notifyListeners();
  }
}
