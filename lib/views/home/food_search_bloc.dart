//Created by Nimish Nandwana on 30/03/2021.

import 'package:flutter/cupertino.dart';
import 'package:quovantis_assignment/extensions/string_extension.dart';
import 'package:quovantis_assignment/models/food_menu.dart';
import 'package:rxdart/rxdart.dart';

class FoodSearchBloc {
  final FoodMenu menu;

  FoodSearchBloc({@required this.menu}) {
    _foodListResponseBS.add(menu);
  }

  final _foodListResponseBS = BehaviorSubject<FoodMenu>();

  Stream<FoodMenu> get foodListStream => _foodListResponseBS.stream;

  void searchFood(String query) {
    if (query.isNullOrEmpty) {
      clearFilteredSearch();
      return;
    }
    FoodMenu filteredMenu = FoodMenu(categories: []);

    for (int i = 0; i < menu.categories.length; i++) {
      final nimi = menu.categories[i].category.allSubcategories
          .where((element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();

      if (nimi.length > 0) {
        filteredMenu.categories.add(CategoryElement(
            category: menu.categories[i].category.copyWith(allSubcategories: nimi,isSearched:
            true)));
      }
    }

    _foodListResponseBS.add(filteredMenu);
  }

  void clearFilteredSearch() {
    _foodListResponseBS.add(menu);
  }
}
