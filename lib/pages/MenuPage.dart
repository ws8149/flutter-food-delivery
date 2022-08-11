import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/pages/FoodHomeBloc/food_home_bloc.dart';

import '../components/AppNavBar.dart';
import '../components/AppScaffold.dart';
import 'dart:math';

import '../components/SearchBar.dart';
import '../repositories/FoodCategory.dart';
import 'FoodHomePage.dart';


class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int FOOD_OPTION = 1;
  int BEVERAGE_OPTION = 2;

  Future<void> initMenuPage() async {
  }

  @override
  void initState() {
    super.initState();
    initMenuPage();
  }


  void goToFoodHomePage () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MultiRepositoryProvider(
              providers: [
                RepositoryProvider(create: (context) => FoodCategoryService()),
              ],
              child: FoodHomePage(),
            ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppNavBar(
        label: 'Menu',
        actionWidget: InkWell(
          child: Icon(Icons.shopping_cart),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                BackgroundBar(),
                Column(
                  children: [
                    SizedBox(height: 30),

                    MenuButton(
                      imageIcon: Material(
                        borderRadius: BorderRadius.circular(30),
                        elevation: 2,
                        child: CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: Image(image: AssetImage('lib/assets/food.jpg'))
                            ),
                        ),
                      ),
                      label: 'Food',
                      sublabel: '${Random().nextInt(120).toString()} items',
                      onTap: () {
                        goToFoodHomePage();
                      },
                    ),

                    SizedBox(height: 30),

                    MenuButton(
                      imageIcon: Material(
                        borderRadius: BorderRadius.circular(20),
                        elevation: 2,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              image: AssetImage('lib/assets/beverage.jpg'),
                              width: 60,
                              height: 60,
                            )
                        ),
                      ),
                      label: 'Beverage',
                      sublabel: '${Random().nextInt(120).toString()} items',
                      onTap: () {

                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

class MenuButton extends StatelessWidget {
  final Widget imageIcon;
  final String label;
  final String sublabel;
  final Function onTap;

  const MenuButton({
    Key? key, required this.imageIcon, required this.label, required this.sublabel, required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onTap();},
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(height: 50, width: 50),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft:  Radius.circular(30.0),
                      bottomLeft:  Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  height: 80,
                  child: Row(
                    children: [
                      SizedBox(width: 50),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Text(sublabel, style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50, width: 50),
            ],
          ),
          Positioned(
              top: 13,
              left: 25,
              child: imageIcon
          ),
          Positioned(
              top: 25,
              right: 35,
              child: ChevronIcon()
          ),
        ],

      ),
    );
  }
}

class ChevronIcon extends StatelessWidget {
  const ChevronIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 30,
        width: 30,
        child: Icon(Icons.chevron_right, color: Colors.red.shade800),

    );
  }
}

class BackgroundBar extends StatelessWidget {
  const BackgroundBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red.shade800,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
        ),
        width: 80,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
    );
  }
}
