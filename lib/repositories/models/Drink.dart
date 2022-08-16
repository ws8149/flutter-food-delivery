// To parse this JSON data, do
//
//     final drink = drinkFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

Drink drinkFromJson(String str) => Drink.fromJson(json.decode(str));

String drinkToJson(Drink data) => json.encode(data.toJson());

class Drink {
  Drink({
    required this.idDrink,
    required this.strDrink,
    required this.strDrinkThumb,
  });

  String idDrink;
  String strDrink;
  String strDrinkThumb;

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    idDrink: json["idDrink"],
    strDrink: json["strDrink"],
    strDrinkThumb: json["strDrinkThumb"],
  );

  Map<String, dynamic> toJson() => {
    "idDrink": idDrink,
    "strDrink": strDrink,
    "strDrinkThumb": strDrinkThumb,
  };

  @override
  String toString() {
    return 'Drink{idDrink: $idDrink, strDrink: $strDrink, strDrinkThumb: $strDrinkThumb}';
  }
}

DrinkList drinkListFromJson(String str) => DrinkList.fromJson(json.decode(str));

String drinkListToJson(DrinkList data) => json.encode(data.toJson());

class DrinkList {
  DrinkList({
    required this.drinks,
  });

  List<Drink> drinks;

  factory DrinkList.fromJson(Map<String, dynamic> json) => DrinkList(
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };

  @override
  Drink operator [](int index) => drinks[index];

  @override
  int get length => drinks.length;

  @override
  map(Container Function(Drink drink) f) {
    return drinks.map(f);
  }
}