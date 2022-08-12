part of 'drink_home_bloc.dart';

abstract class DrinkHomeEvent extends Equatable {
  const DrinkHomeEvent();
}

class LoadApiEvent extends DrinkHomeEvent {
  @override
  List<Object?> get props => [];
}
