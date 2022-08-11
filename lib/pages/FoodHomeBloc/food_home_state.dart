part of 'food_home_bloc.dart';

abstract class FoodHomeState extends Equatable {
  const FoodHomeState();
}

class FoodHomeLoadingState extends FoodHomeState {
  @override
  List<Object> get props => [];
}

class FoodHomeLoadedState extends FoodHomeState {
  final FoodCategoryList foodCategoryList;

  FoodHomeLoadedState(this.foodCategoryList);

  @override
  List<Object?> get props => [this.foodCategoryList];


}
