part of 'splash_page_bloc.dart';

@immutable
abstract class SplashPageState extends Equatable {
    const SplashPageState();
    @override
    List<Object> get props => [];
}

class SplashPageInitial extends SplashPageState {}

class MoveToHomeScreen extends SplashPageState {}
