import 'package:flutter/material.dart';

import '../components/AppNavBar.dart';
import '../components/AppScaffold.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> initHomePage() async {
  }

  @override
  void initState() {
    super.initState();
    initHomePage();
  }


  void goToFoodPage () {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => EditTodoPage(id: todo.id!, todoItem: todo))
    // );
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
          SearchBar(),
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                BackgroundBar(),
                Column(
                  children: [
                    SizedBox(height: 30),
                    Stack(
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
                                        children: [
                                          Text('Food', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                          Text('120 items', style: TextStyle(fontSize: 11, color: Colors.grey)),
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
                            child: ImageIcon(
                                image: Image(image: AssetImage('lib/assets/food.jpg')),
                                radius: 30
                            )
                        ),
                        Positioned(
                            top: 25,
                            right: 35,
                            child: ChevronIcon()
                        ),
                      ],

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

class ImageIcon extends StatelessWidget {
  final Image image;
  final double radius;

  const ImageIcon({
    Key? key,
    required this.image,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: 2,
      child: CircleAvatar(
        radius: radius,
        child: ClipOval(
          child: image,
        )
      ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: TextField(
          decoration:InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            labelText: 'Search Food',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: Icon(Icons.search)
          ),
        ),
      ),
    );
  }
}
