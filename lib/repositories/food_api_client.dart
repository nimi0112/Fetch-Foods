import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:quovantis_assignment/models/models.dart';

import '../constants.dart';

class MenuApiClient {
  final Dio dio;

  MenuApiClient({
    @required this.dio,
  }) : assert(dio != null);

  Future<FoodMenu> fetchFoodMenu() async {
    try {
      final Response response = await dio.get(GET_MENU_URL);
      return FoodMenu.fromJson(response.data);
    } on DioError catch (e) {
      throw new Exception(e.message);
    }
  }
}
