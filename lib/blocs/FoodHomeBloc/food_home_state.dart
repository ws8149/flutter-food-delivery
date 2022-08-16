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
  final FoodList foodList;

  FoodHomeLoadedState(this.foodCategoryList, this.foodList);

  @override
  List<Object?> get props => [this.foodCategoryList, this.foodList];


}
