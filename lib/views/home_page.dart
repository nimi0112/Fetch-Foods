import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quovantis_assignment/bloc/bloc.dart';
import 'package:quovantis_assignment/models/models.dart';

import 'home/FoodsListPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuEmpty) {
          BlocProvider.of<MenuBloc>(context).add(FetchFoodMenu());
        }
        if (state is MenuError) {
          return Center(
            child: Text('failed to fetch Menu'),
          );
        }
        if (state is MenuLoaded) {
          return FoodsListPage(menu: state.menu);
        }
        return Center(
          child: InkWell(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
