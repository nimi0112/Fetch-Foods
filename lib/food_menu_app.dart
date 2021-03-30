import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quovantis_assignment/bloc/bloc.dart';
import 'package:quovantis_assignment/repositories/repositories.dart';
import 'package:quovantis_assignment/resources/app_colors.dart';
import 'package:quovantis_assignment/views/home_page.dart';

//Created by Nimish Nandwana on 28/03/2021.

class FoodMenuApp extends StatelessWidget {
  final MenuRepository repository;

  FoodMenuApp({Key key, @required this.repository})
      : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorLightGrey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light.copyWith(
              systemNavigationBarColor: colorLightGrey,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: colorLightGrey,
              systemNavigationBarIconBrightness: Brightness.dark),
          child: BlocProvider(
            create: (context) => MenuBloc(repository: repository),
            child: SafeArea(bottom: false, child: HomePage()),
          ),
        ));
  }
}
