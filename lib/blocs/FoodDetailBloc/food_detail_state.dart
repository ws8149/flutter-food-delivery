part of 'food_detail_bloc.dart';

abstract class FoodDetailState extends Equatable {
  const FoodDetailState();
}

class FoodDetailLoadingState extends FoodDetailState {
  @override
  List<Object> get props => [];
}

class FoodDetailLoadedState extends FoodDetailState {
  final FoodCategoryList foodCategoryList;
  final FoodList foodList;

  FoodDetailLoadedState(this.foodCategoryList, this.foodList);

  @override
  List<Object?> get props => [this.foodCategoryList, this.foodList];


}
