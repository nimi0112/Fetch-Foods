import 'package:equatable/equatable.dart';

abstract class FoodMenuEvent extends Equatable {
  const FoodMenuEvent();
}

class FetchFoodMenu extends FoodMenuEvent {
  const FetchFoodMenu();

  @override
  List<Object> get props => [];
}
