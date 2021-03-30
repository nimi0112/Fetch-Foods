part of 'splash_page_bloc.dart';

@immutable
abstract class SplashPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartSplashTimer extends SplashPageEvent {}

class MoveToNextScreen extends SplashPageEvent {}


