import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quovantis_assignment/models/models.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuEmpty extends MenuState {}

class MenuLoading extends MenuState {}

class MenuLoaded extends MenuState {
  final FoodMenu menu;

  const MenuLoaded({@required this.menu}) : assert(menu != null);

  @override
  List<Object> get props => [menu];
}

class MenuError extends MenuState {}
