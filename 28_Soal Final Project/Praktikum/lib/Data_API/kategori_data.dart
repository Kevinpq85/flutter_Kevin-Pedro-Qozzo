import 'package:dio/dio.dart';
import 'package:project_alta/Model/katgori_model.dart';

class CategorieData {
  static Future<List<Categories>> GetCategories() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');

    return (response.data['categories'] as List)
        .map((e) => Categories.fromJson(e))
        .toList();
  }

  static Future<List<String>> GetCategorieTitle() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/categories.php');

    List<String> CategorieTitleList = [];
    for (int i = 0; i < response.data['categories'].length; i++) {
      CategorieTitleList.add(response.data['categories'][i]['strCategory']);
    }

    return CategorieTitleList;
  }
}
