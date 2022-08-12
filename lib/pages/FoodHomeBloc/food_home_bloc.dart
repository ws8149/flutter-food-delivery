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
      FoodList foodList = await _api.getFoodList();

      emit(FoodHomeLoadedState(categoryList, foodList));

    });
  }
}
