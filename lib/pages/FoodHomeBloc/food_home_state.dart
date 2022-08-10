part of 'food_home_bloc.dart';

abstract class FoodHomeState extends Equatable {
  const FoodHomeState();
}

class FoodHomeLoadingState extends FoodHomeState {
  @override
  List<Object> get props => [];
}

class FoodHomeLoadedState extends FoodHomeState {
  final String strCategory;
  final String strCategoryThumb;

  FoodHomeLoadedState(this.strCategory, this.strCategoryThumb);

  @override
  List<Object?> get props => [this.strCategory, this.strCategoryThumb];


}
