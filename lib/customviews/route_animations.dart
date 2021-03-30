import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:quovantis_assignment/extensions/string_extension.dart';
import 'custom_cupertino_page_transition.dart';

class RouteAnimationSlideFromRight extends PageRouteBuilder {
  RouteAnimationSlideFromRight({
    this.widget,
    this.routeName,
    this.shouldMaintainState = true,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return CustomCupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: false,
            isSlideFromRight: true,
            child: child,
          );
        });

  final Widget widget;
  final String routeName;
  final bool shouldMaintainState;

  @override
  RouteSettings get settings {
    if (routeName.isNullOrEmpty) {
      return super.settings;
    } else {
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
    }
  }

  @override
  bool get maintainState {
    return shouldMaintainState;
  }
}

class RouteAnimationFadeIn extends PageRouteBuilder {
  RouteAnimationFadeIn(this.widget, this.shouldMaintainState, {this.routeName})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return widget;
        }, transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        });

  final Widget widget;
  final String routeName;
  final bool shouldMaintainState;

  @override
  bool get maintainState {
    return shouldMaintainState;
  }

  @override
  RouteSettings get settings {
    if (routeName.isNullOrEmpty)
      return super.settings;
    else
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
  }
}

class FadeInWithSlideUpAnimation extends StatelessWidget {
  final double delay;
  final double animationHeight;
  final Widget child;

  FadeInWithSlideUpAnimation({this.delay = 1, this.child, this.animationHeight = 40});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY")
          .add(Duration(milliseconds: 400), Tween(begin: 40.0, end: 0.0), curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}

class RouteAnimationSlideFromBottom extends PageRouteBuilder {
  final Widget widget;
  final String routeName;

  RouteAnimationSlideFromBottom({this.widget, this.routeName})
      : super(pageBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return widget;
  }, transitionsBuilder: (BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  });

  @override
  RouteSettings get settings {
    if (routeName.isNullOrEmpty)
      return super.settings;
    else
      return RouteSettings(
        name: routeName,
        arguments: super.settings.arguments,
      );
  }
}
