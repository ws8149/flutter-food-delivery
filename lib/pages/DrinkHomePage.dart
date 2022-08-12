import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/components/AppScaffold.dart';
import 'package:flutter_food_delivery/components/SearchBar.dart';
import 'package:flutter_food_delivery/pages/DrinkHomeBloc/drink_home_bloc.dart';
import 'package:flutter_food_delivery/repositories/DrinkCategory.dart';

import '../components/AppNavBar.dart';
import '../repositories/DrinkCategory.dart';

class DrinkHomePage extends StatelessWidget {
  const DrinkHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrinkHomeBloc(
          RepositoryProvider.of<DrinkCategoryService>(context)
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
      child: Column(
        children: [
          CircularProgressIndicator(),
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
                            child: Image(
                              height: 60,
                              width: 60,
                              image: AssetImage('lib/assets/beverage.jpg'),
                            ),
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

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Popular Drink', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),

          SizedBox(height: 20),

          PopularCard(),
          SizedBox(height: 20),
          PopularCard(),
          SizedBox(height: 20),
          PopularCard(),

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

class PopularCard extends StatelessWidget {
  const PopularCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('lib/assets/hardcoded.jpg'),
          width: MediaQuery.of(context).size.width,
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hardcoded by Wilson', style: TextStyle(fontWeight: FontWeight.bold)),

              Row(
                children: [
                  Icon(Icons.star, color: Colors.red.shade800),
                  Text('4.9', style: TextStyle(color: Colors.red.shade800)),
                  SizedBox(width: 5),
                  Text('(124 Ratings) Cafe', style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 5),
                  Icon(Icons.circle, color: Colors.red.shade800, size: 4),
                  SizedBox(width: 5),
                  Text('Western Drink', style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),
        )

      ],
    );
  }
}
