import 'package:flutter/material.dart';
import 'package:flutter_food_delivery/pages/MenuPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      home: MenuPage(),
    );
  }
}

