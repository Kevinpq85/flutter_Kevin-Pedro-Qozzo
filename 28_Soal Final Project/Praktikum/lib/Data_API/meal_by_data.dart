import 'package:dio/dio.dart';
import 'package:project_alta/Model/meal_by_kategori_model.dart';

class MealByData {
  static Future<List<MealsByCategorie>> GetMealByCategory(
      String CategoryName) async {
    Response response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$CategoryName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategorie.fromJson(e))
        .toList();
  }

  static Future<List<MealsByCategorie>> GetMealByArea(String AreaName) async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=$AreaName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategorie.fromJson(e))
        .toList();
  }

  static Future<List<MealsByCategorie>> GetMealByCIntegration(
      String ingredientName) async {
    Response response = await Dio().get(
        'http://www.themealdb.com/api/json/v1/1/filter.php?i=$ingredientName');

    return (response.data['meals'] as List)
        .map((e) => MealsByCategorie.fromJson(e))
        .toList();
  }
}
