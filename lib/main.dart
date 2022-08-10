import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/pages/FoodHomePage.dart';
import 'package:flutter_food_delivery/repositories/FoodCategory.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => FoodCategoryService())
        ],
        child: FoodHomePage(),
      ),
    );
  }
}

