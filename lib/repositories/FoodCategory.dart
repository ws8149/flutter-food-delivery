// To parse this JSON data, do
//
//     final foodCategory = foodCategoryFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

FoodCategory foodCategoryFromJson(String str) => FoodCategory.fromJson(json.decode(str));

String foodCategoryToJson(FoodCategory data) => json.encode(data.toJson());

class FoodCategory extends Equatable {
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

  bool operator ==(Object other) {
    return other is FoodCategory
        && this.idCategory == other.idCategory
        && this.strCategory == other.strCategory
        && this.strCategoryThumb == other.strCategoryThumb
        && this.strCategoryDescription == other.strCategoryDescription;
  }

  @override
  String toString() {
    return 'FoodCategory{idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription}';
  }

  @override
  List<Object> get props => [idCategory, strCategory, strCategoryThumb, strCategoryDescription];
}

FoodCategoryList foodCategoryListFromJson(String str) => FoodCategoryList.fromJson(json.decode(str));

String foodCategoryListToJson(FoodCategoryList data) => json.encode(data.toJson());

class FoodCategoryList extends Equatable {
  FoodCategoryList({
    required this.categories,
  });

  List<FoodCategory> categories;

  factory FoodCategoryList.fromJson(Map<String, dynamic> json) => FoodCategoryList(
    categories: List<FoodCategory>.from(json["categories"].map((x) => FoodCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };

  @override
  FoodCategory operator [](int index) => categories[index];

  @override
  int get length => categories.length;

  @override
  String toString() {
    return this.categories.toString();
  }

  @override
  List<Object?> get props => [categories];



}