part of 'food_detail_bloc.dart';

abstract class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();
}

class LoadApiEvent extends FoodDetailEvent {
  @override
  List<Object?> get props => [];
}