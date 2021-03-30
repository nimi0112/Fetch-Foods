import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'splash_page_event.dart';

part 'splash_page_state.dart';

class SplashPageBloc extends Bloc<SplashPageEvent, SplashPageState> {
  @override
  SplashPageState get initialState => SplashPageInitial();

  @override
  Stream<SplashPageState> mapEventToState(
    SplashPageEvent event,
  ) async* {

    if (event is MoveToNextScreen) {
      yield MoveToHomeScreen();
    }
  }
}
