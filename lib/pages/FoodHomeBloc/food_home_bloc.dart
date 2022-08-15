import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/ApiService.dart';
import '../../repositories/Food.dart';
import '../../repositories/FoodCategory.dart';

part 'food_home_event.dart';
part 'food_home_state.dart';

class FoodHomeBloc extends Bloc<FoodHomeEvent, FoodHomeState> {
  final ApiService _api;

  FoodHomeBloc(this._api) : super(FoodHomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      print('Loading Api Event...');
      emit(FoodHomeLoadingState());

      FoodCategoryList categoryList = await _api.getFoodCategory();

      // Assign Beef by default
      FoodList foodList = await _api.getFoodList('Beef');

      emit(FoodHomeLoadedState(categoryList, foodList));

    });

    on<SelectCategoryEvent>((event, emit) async {
      print('Select Category Event...');

      final currentState = state as FoodHomeLoadedState;
      FoodCategoryList _foodCategoryList = currentState.foodCategoryList;

      emit(FoodHomeLoadingState());

      FoodList foodList = await _api.getFoodList(event.categoryText);

      emit(FoodHomeLoadedState(_foodCategoryList, foodList));
    });
  }

  get initialState => this.state;
}
