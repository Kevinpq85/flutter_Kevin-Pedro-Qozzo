import 'package:dio/dio.dart';

class AreaData {
  static Future<List<String>> GetArea() async {
    Response response = await Dio()
        .get('https://www.themealdb.com/api/json/v1/1/list.php?a=list');
    List<String> AreaList = [];
    if (response.statusCode == 200) {
      for (int i = 0; i < response.data['meals'].length; i++) {
        AreaList.add(response.data['meals'][i]['strArea']);
      }
    }

    return AreaList;
  }
}
