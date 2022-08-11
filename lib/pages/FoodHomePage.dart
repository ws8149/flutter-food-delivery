import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/components/AppScaffold.dart';
import 'package:flutter_food_delivery/components/SearchBar.dart';
import 'package:flutter_food_delivery/pages/FoodHomeBloc/food_home_bloc.dart';
import 'package:flutter_food_delivery/repositories/FoodCategory.dart';

import '../components/AppNavBar.dart';

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodHomeBloc(
          RepositoryProvider.of<FoodCategoryService>(context)
      )..add(LoadApiEvent()),
      child: AppScaffold(
        appBar: AppNavBar(
          label: 'Good Morning Akila!',
          actionWidget: InkWell(
            child: Icon(Icons.shopping_cart),
          ),
        ),
        body: BlocBuilder<FoodHomeBloc, FoodHomeState>(
            builder: (context, state) {

              if (state is FoodHomeLoadingState) {
                return LoadingSpinner();
              }

              if (state is FoodHomeLoadedState) {
                return LoadedPage(state: state);
              }

              return Container();
          }
        ),
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<FoodHomeBloc>(context).add(LoadApiEvent());
              },
              child: Text('LOAD AGAIN')
          )
        ],
      ),
    );
  }
}

class LoadedPage extends StatelessWidget {
  final FoodHomeLoadedState state;

  const LoadedPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivering to', style: TextStyle(color: Colors.grey)),

          Row(
            children: [
              Text(
                'Current Location',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              SizedBox(width: 30),
              Icon(Icons.arrow_drop_down, color: Colors.red.shade800)
            ],
          ),

          SizedBox(height: 30),

          SearchBar(),

          SizedBox(height: 10),

          Container(
            height: 120,
            child: ListView.builder(
              itemCount: state.foodCategoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                FoodCategory category = state.foodCategoryList[index];

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: [
                        SizedBox(height: 10),

                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                                category.strCategoryThumb
                            )
                        ),

                        SizedBox(height: 10),

                        Text(
                          category.strCategory,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),


          ElevatedButton(
              onPressed: () {
                BlocProvider.of<FoodHomeBloc>(context).add(LoadApiEvent());
              },
              child: Text('LOAD AGAIN')
          )
        ],
      ),
    );
  }
}
