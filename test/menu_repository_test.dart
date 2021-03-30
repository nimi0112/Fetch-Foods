import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:quovantis_assignment/repositories/food_api_client.dart';
import 'package:quovantis_assignment/repositories/quote_repository.dart';

class MockQuoteApiClient extends Mock implements MenuApiClient {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => MenuRepository(menuApiClient: null),
        throwsA(isAssertionError),
      );
    });
  });
}
