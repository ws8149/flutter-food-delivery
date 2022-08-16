import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/components/AppScaffold.dart';
import 'package:flutter_food_delivery/components/SearchBar.dart';
import 'package:flutter_food_delivery/blocs/DrinkHomeBloc/drink_home_bloc.dart';
import 'package:flutter_food_delivery/repositories/ApiService.dart';
import 'package:flutter_food_delivery/repositories/models/DrinkCategory.dart';

import '../components/AppNavBar.dart';
import '../repositories/models/Drink.dart';

class DrinkHomePage extends StatelessWidget {
  const DrinkHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinkHomeBloc(
          RepositoryProvider.of<ApiService>(context),
      )..add(LoadApiEvent()),
      child: AppScaffold(
        appBar: AppNavBar(
          label: 'Good Morning Akila!',
          actionWidget: InkWell(
            child: Icon(Icons.shopping_cart),
          ),
        ),
        body: BlocBuilder<DrinkHomeBloc, DrinkHomeState>(
            builder: (context, state) {

              if (state is DrinkHomeLoadingState) {
                return LoadingSpinner();
              }

              if (state is DrinkHomeLoadedState) {
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
      child: Flexible(
        fit: FlexFit.loose,
        flex: 1,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class LoadedPage extends StatelessWidget {
  final DrinkHomeLoadedState state;

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
            child: SearchBar(label: 'Search Drink'),
          ),

          Container(
            height: 120,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10),
              itemCount: state.drinkCategoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                DrinkCategory category = state.drinkCategoryList[index];

                return InkWell(
                  onTap: () {
                    String categoryText = category.strCategory;

                    BlocProvider.of<DrinkHomeBloc>(context).add(
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

                          // Show hardcoded image because strDrinksThumb is missing
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image(image: AssetImage('lib/assets/food.jpg'), height: 60, width: 60 )
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
            child: Text('Popular Drink', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),

          Column(
            children: state.drinkList.map((drink) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),

                    AspectRatio(
                      aspectRatio: 1.5,
                      child: Image.network(
                        drink.strDrinkThumb,
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
                            drink.strDrink,
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
                              Text('Western Drink', style: TextStyle(color: Colors.grey)),
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
                BlocProvider.of<DrinkHomeBloc>(context).add(LoadApiEvent());
              },
              child: Text('LOAD AGAIN')
          )
        ],
      ),
    );
  }
}

