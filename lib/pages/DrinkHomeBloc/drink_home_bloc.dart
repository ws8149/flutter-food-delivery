import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repositories/DrinkCategory.dart';

part 'drink_home_event.dart';
part 'drink_home_state.dart';

class DrinkHomeBloc extends Bloc<DrinkHomeEvent, DrinkHomeState> {
  final DrinkCategoryService _drinkCategoryService;

  DrinkHomeBloc(this._drinkCategoryService) : super(DrinkHomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      print('Loading Api Event...');
      emit(DrinkHomeLoadingState());

      DrinkCategoryList list = await _drinkCategoryService.getDrinkCategory();

      emit(DrinkHomeLoadedState(list));

    });
  }
}
