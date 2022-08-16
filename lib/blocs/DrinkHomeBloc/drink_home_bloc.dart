import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/ApiService.dart';
import '../../repositories/models/Drink.dart';
import '../../repositories/models/DrinkCategory.dart';

part 'drink_home_event.dart';
part 'drink_home_state.dart';

class DrinkHomeBloc extends Bloc<DrinkHomeEvent, DrinkHomeState> {
  final ApiService _api;

  DrinkHomeBloc(this._api) : super(DrinkHomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      print('Loading Api Event...');
      emit(DrinkHomeLoadingState());

      DrinkCategoryList categoryList = await _api.getDrinkCategory();

      // Assign Beef by default
      DrinkList drinkList = await _api.getDrinkList('Ordinary Drink');

      emit(DrinkHomeLoadedState(categoryList, drinkList));

    });

    on<SelectCategoryEvent>((event, emit) async {
      print('Select Category Event...');

      final currentState = state as DrinkHomeLoadedState;
      DrinkCategoryList _drinkCategoryList = currentState.drinkCategoryList;

      emit(DrinkHomeLoadingState());

      DrinkList drinkList = await _api.getDrinkList(event.categoryText);

      emit(DrinkHomeLoadedState(_drinkCategoryList, drinkList));
    });
  }
}
