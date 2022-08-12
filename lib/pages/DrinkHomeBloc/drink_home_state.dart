part of 'drink_home_bloc.dart';

abstract class DrinkHomeState extends Equatable {
  const DrinkHomeState();
}

class DrinkHomeLoadingState extends DrinkHomeState {
  @override
  List<Object> get props => [];
}

class DrinkHomeLoadedState extends DrinkHomeState {
  final DrinkCategoryList drinkCategoryList;

  DrinkHomeLoadedState(this.drinkCategoryList);

  @override
  List<Object?> get props => [this.drinkCategoryList];


}
