import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery/components/AppScaffold.dart';
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
          label: 'Welcome Akila!',
          actionWidget: InkWell(
            child: Icon(Icons.shopping_cart),
          ),
        ),
        body: BlocBuilder<FoodHomeBloc, FoodHomeState>(
            builder: (context, state) {

              if (state is FoodHomeLoadingState) {
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

              if (state is FoodHomeLoadedState) {
                return Column(
                  children: [
                    Text(state.strCategory),
                    Text(state.strCategoryThumb),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<FoodHomeBloc>(context).add(LoadApiEvent());
                        }, 
                        child: Text('LOAD AGAIN')
                    )
                  ],
                );
              }

              return Container();
          }
        ),
      ),
    );
  }
}
