import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/FoodCategory.dart';

part 'food_home_event.dart';
part 'food_home_state.dart';

class FoodHomeBloc extends Bloc<FoodHomeEvent, FoodHomeState> {
  final FoodCategoryService _foodCategoryService;

  FoodHomeBloc(this._foodCategoryService) : super(FoodHomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      print('Loading Api Event...');
      emit(FoodHomeLoadingState());

      FoodCategoryList list = await _foodCategoryService.getFoodCategory();

      emit(FoodHomeLoadedState(list));

    });
  }
}
