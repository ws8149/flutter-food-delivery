// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';


Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  Food({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  String idMeal;
  String strMeal;
  String strMealThumb;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    idMeal: json["idMeal"],
    strMeal: json["strMeal"],
    strMealThumb: json["strMealThumb"],
  );

  Map<String, dynamic> toJson() => {
    "idMeal": idMeal,
    "strMeal": strMeal,
    "strMealThumb": strMealThumb,
  };

  @override
  String toString() {
    return 'Food{idMeal: $idMeal, strMeal: $strMeal, strMealThumb: $strMealThumb}';
  }
}

FoodList foodListFromJson(String str) => FoodList.fromJson(json.decode(str));

String foodListToJson(FoodList data) => json.encode(data.toJson());

class FoodList {
  FoodList({
    required this.meals,
  });

  List<Food> meals;

  factory FoodList.fromJson(Map<String, dynamic> json) => FoodList(
    meals: List<Food>.from(json["meals"].map((x) => Food.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
  };

  @override
  Food operator [](int index) => meals[index];

  @override
  int get length => meals.length;

  @override
  map(Container Function(Food food) f) {
    return meals.map(f);
  }
}