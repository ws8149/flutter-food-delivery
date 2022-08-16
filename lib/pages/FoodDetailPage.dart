import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/components/AppScaffold.dart';
import 'package:flutter_food_delivery/components/SearchBar.dart';
import 'package:flutter_food_delivery/blocs/FoodHomeBloc/food_home_bloc.dart';
import 'package:flutter_food_delivery/repositories/ApiService.dart';
import 'package:flutter_food_delivery/repositories/models/FoodCategory.dart';

import '../components/AppLoadingSpinner.dart';
import '../components/AppNavBar.dart';
import '../repositories/models/Food.dart';

class FoodHomePage extends StatelessWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodHomeBloc(
          RepositoryProvider.of<ApiService>(context),
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
                return AppLoadingSpinner();
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

class LoadedPage extends StatelessWidget {
  final FoodHomeLoadedState state;

  const LoadedPage({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left: 25,right: 25),
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
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(left:25 , right: 25),
            child: SearchBar(label: 'Search Food'),
          ),

          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: state.foodCategoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                FoodCategory category = state.foodCategoryList[index];

                return InkWell(
                  onTap: () {
                    String categoryText = category.strCategory;

                    BlocProvider.of<FoodHomeBloc>(context).add(
                      SelectCategoryEvent(categoryText)
                    );
                  },
                  child: Padding(
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
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Popular Food', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),

          Column(
            children: state.foodList.map((food) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),

                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Image.network(
                        food.strMealThumb,
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),

                    SizedBox(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            food.strMeal,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: Colors.red.shade800, size: 14),
                              Text('4.9', style: TextStyle(color: Colors.red.shade800)),
                              SizedBox(width: 5),
                              Text('(124 Ratings) Cafe', style: TextStyle(color: Colors.grey)),
                              SizedBox(width: 5),
                              Icon(Icons.circle, color: Colors.red.shade800, size: 4),
                              SizedBox(width: 5),
                              Text('Western Food', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        )



                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
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

