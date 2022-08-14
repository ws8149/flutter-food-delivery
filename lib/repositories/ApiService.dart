import 'package:http/http.dart';

import 'Food.dart';
import 'FoodCategory.dart';

class ApiService {
  Future<FoodList>  getFoodList (String category) async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}'));

    print('api request str:https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}');

    FoodList list = foodListFromJson(response.body);

    return list;
  }

  Future<FoodCategoryList>  getFoodCategory () async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    FoodCategoryList list = foodCategoryListFromJson(response.body);

    return list;
  }
}