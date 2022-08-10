// To parse this JSON data, do
//
//     final foodCategory = foodCategoryFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

FoodCategory foodCategoryFromJson(String str) => FoodCategory.fromJson(json.decode(str));

String foodCategoryToJson(FoodCategory data) => json.encode(data.toJson());

class FoodCategory {
  FoodCategory({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  factory FoodCategory.fromJson(Map<String, dynamic> json) => FoodCategory(
    idCategory: json["idCategory"],
    strCategory: json["strCategory"],
    strCategoryThumb: json["strCategoryThumb"],
    strCategoryDescription: json["strCategoryDescription"],
  );

  Map<String, dynamic> toJson() => {
    "idCategory": idCategory,
    "strCategory": strCategory,
    "strCategoryThumb": strCategoryThumb,
    "strCategoryDescription": strCategoryDescription,
  };
}

class FoodCategoryService {
  // Future<FoodCategory> getFoodCategory () async {
  //   final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
  //   final jsonBody = jsonDecode(response.body);
  //   final category = foodCategoryFromJson(jsonBody["categories"][0]);
  //   return category;
  // }

  dynamic getFoodCategory () async {
    final response = await get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    final jsonBody = jsonDecode(response.body);
    final category = jsonBody["categories"][0];
    return category;
  }
}