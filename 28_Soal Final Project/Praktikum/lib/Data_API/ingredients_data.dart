import 'package:dio/dio.dart';

class IngredientData {
  static Future<List<String>> GetIngredientTitle() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/list.php?i=list');
    List<String> IngredientTitleList = [];
    for (int i = 0; i < response.data['meals'].length; i++) {
      IngredientTitleList.add(response.data['meals'][i]['strIngredient']);
    }

    return IngredientTitleList;
  }
}
