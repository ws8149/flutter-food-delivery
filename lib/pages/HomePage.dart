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
        label: 'To-Do List',
      ),
      body: Container(),
    );
  }
}
