import 'package:http/http.dart';

import 'models/Drink.dart';
import 'models/DrinkCategory.dart';
import 'models/Food.dart';
import 'models/FoodCategory.dart';
import 'models/FoodDetail.dart';

class ApiService {
  Future<FoodList>  getFoodList (String category) async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=${category}'));

    FoodList list = foodListFromJson(response.body);

    return list;
  }

  Future<FoodCategoryList>  getFoodCategory () async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    FoodCategoryList list = foodCategoryListFromJson(response.body);

    return list;
  }

  Future<FoodDetail>  getFoodDetail () async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata'));

    Meals meals = mealsFromJson(response.body);

    return meals.getFoodDetail();
  }

  Future<DrinkList>  getDrinkList (String category) async {
    final response = await get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=${category}'));

    DrinkList list = drinkListFromJson(response.body);

    return list;
  }

  Future<DrinkCategoryList>  getDrinkCategory () async {
    final response = await get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list'));

    DrinkCategoryList list = drinkCategoryListFromJson(response.body);

    return list;
  }


}