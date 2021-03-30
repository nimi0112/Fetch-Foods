import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_assignment/views/splash/splash_page.dart';
import 'package:quovantis_assignment/views/splash/splash_page_bloc.dart';

//Created by Nimish Nandwana on 28/03/2021.

class SplashProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SplashPageBloc(),
        child: SplashPage(),
      ),
    );
  }
}
