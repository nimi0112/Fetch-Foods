import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quovantis_assignment/views/splash/splash_provider.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    //print the transition
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: RemoveOverScrollGlow(),
          child: child,
        );
      },
      home: SplashProvider()));
}

class RemoveOverScrollGlow extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
