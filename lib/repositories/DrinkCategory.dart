// To parse this JSON data, do
//
//     final drinkCategory = drinkCategoryFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

DrinkCategory drinkCategoryFromJson(String str) => DrinkCategory.fromJson(json.decode(str));

String drinkCategoryToJson(DrinkCategory data) => json.encode(data.toJson());

class DrinkCategory {
  DrinkCategory({
    required this.strCategory,
  });

  String strCategory;


  factory DrinkCategory.fromJson(Map<String, dynamic> json) => DrinkCategory(
    strCategory: json["strCategory"],
  );

  Map<String, dynamic> toJson() => {
    "strCategory": strCategory,
  };

  @override
  String toString() {
    return 'DrinkCategory{strCategory: $strCategory}';
  }
}

DrinkCategoryList drinkCategoryListFromJson(String str) => DrinkCategoryList.fromJson(json.decode(str));

String drinkCategoryListToJson(DrinkCategoryList data) => json.encode(data.toJson());

class DrinkCategoryList {
  DrinkCategoryList({
    required this.categories,
  });

  List<DrinkCategory> categories;

  factory DrinkCategoryList.fromJson(Map<String, dynamic> json) => DrinkCategoryList(
    categories: List<DrinkCategory>.from(json["drinks"].map((x) => DrinkCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(categories.map((x) => x.toJson())),
  };

  @override
  DrinkCategory operator [](int index) => categories[index];

  @override
  int get length => categories.length;

}