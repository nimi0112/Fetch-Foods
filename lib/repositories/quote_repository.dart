import 'dart:async';

import 'package:meta/meta.dart';
import 'package:quovantis_assignment/models/models.dart';
import 'package:quovantis_assignment/repositories/food_api_client.dart';

class MenuRepository {
  final MenuApiClient menuApiClient;

  MenuRepository({@required this.menuApiClient}) : assert(menuApiClient != null);

  Future<FoodMenu> fetchMenu() async {
    return await menuApiClient.fetchFoodMenu();
  }
}
