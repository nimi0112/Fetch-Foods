//Created by Nimish Nandwana on 28/03/2021.

import 'package:quovantis_assignment/repositories/food_api_client.dart';
import 'package:quovantis_assignment/repositories/quote_repository.dart';

import 'dio_provider.dart';

class MenuRepoProvider {
  //   private constructor restricted to this class itself
  MenuRepoProvider._();

  static MenuRepository _repository;

  static MenuRepository getInstance() {
    return _repository ??= MenuRepository(
      menuApiClient: MenuApiClient(
        dio: DioProvider.getInstance(),
      ),
    );
  }
}
