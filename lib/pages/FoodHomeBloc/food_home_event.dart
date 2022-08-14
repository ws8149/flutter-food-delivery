part of 'food_home_bloc.dart';

abstract class FoodHomeEvent extends Equatable {
  const FoodHomeEvent();
}

class LoadApiEvent extends FoodHomeEvent {
  @override
  List<Object?> get props => [];
}

class SelectCategoryEvent extends FoodHomeEvent {
  final String categoryText;

  SelectCategoryEvent(this.categoryText);

  @override
  List<Object?> get props => [];
}