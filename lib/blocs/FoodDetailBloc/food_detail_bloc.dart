import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/ApiService.dart';
import '../../repositories/models/Food.dart';
import '../../repositories/models/FoodCategory.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  final ApiService _api;

  FoodDetailBloc(this._api) : super(FoodDetailLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      print('Loading Api Event...');
      emit(FoodDetailLoadingState());

      FoodCategoryList categoryList = await _api.getFoodCategory();

      // Assign Beef by default
      FoodList foodList = await _api.getFoodList('Beef');

      emit(FoodDetailLoadedState(categoryList, foodList));

    });
  }

  get initialState => this.state;
}
