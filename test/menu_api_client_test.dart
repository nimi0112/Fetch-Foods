import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quovantis_assignment/constants.dart';
import 'package:quovantis_assignment/models/models.dart';
import 'package:quovantis_assignment/repositories/food_api_client.dart';

class MockQuoteApiClient extends Mock implements MenuApiClient {
  MenuApiClient _real;

  MockQuoteApiClient(Dio dio) {
    _real = MenuApiClient(dio: dio);
    when(fetchFoodMenu()).thenAnswer((_) => _real.fetchFoodMenu());
  }
}

class MockHttpClient extends Mock implements Dio {}

void main() {
  group('assertion', () {
    test('should assert if null', () {
      expect(
        () => MenuApiClient(dio: null),
        throwsA(isAssertionError),
      );
    });
  });

  group('fetchQuote', () {
    final mockHttpClient = MockHttpClient();
    final mockQuoteApiClient = MockQuoteApiClient(mockHttpClient);
    test('return Menu if http call successfully', () async {
      // given
      final mockQuote = FoodMenu.fromJson(jsonDecode(SampleJsonStringForTest));

      // when
      when(mockHttpClient.get(GET_MENU_URL)).thenAnswer((_) async =>
          Future.value(Response(data: jsonDecode(SampleJsonStringForTest), statusCode: 200)));

      //then
      expect(await mockQuoteApiClient.fetchFoodMenu(), mockQuote);
      expect(foodMenuToJson(mockQuote), foodMenuToJson(foodMenuFromJson(SampleJsonStringForTest)));
    });

    test('return Exception if http call error', () async {
      when(mockHttpClient.get(GET_MENU_URL)).thenThrow(DioError(
          error: "API is throwing error",
          request: null,
          response: null,
          type: DioErrorType.DEFAULT));

      expect(() async => await mockQuoteApiClient.fetchFoodMenu(), throwsA(isException));
    });
  });
}

const SampleJsonStringForTest = "{\n\t\"categories\": [{\n\t\t\"category\": {\n\t\t\t\"subca"
    "tegories\": [{\n\t\t\t\t\"items\": [\"Beef (93/7 ground)\", \"Bi"
    "son\", \"Filet Mignon (trim fat)\", \"Kangaroo\", \"Sirloin (gro"
    "und)\", \"Sirloin Strip Steak\", \"Veal (Ground)\", \"Veni"
    "son\"],\n\t\t\t\t\"subCategoryname\": \"Beef\"\n\t\t\t}, {\n\t\t\t\t\"ite"
    "ms\": [\"Lean Loin Chop\", \"Lean Pork Loin\"],\n\t\t\t\t\"subCategory"
    "name\": \"Pork\"\n\t\t\t}, {\n\t\t\t\t\"items\": [\"Chicken\", \"Cornish G"
    "ame Hen\", \"Emu\", \"Ostrich\", \"Quail\", \"Turkey\"],\n\t\t\t\t\"subCate"
    "goryname\": \"Poultry\"\n\t\t\t}],\n\t\t\t\"quote\": \"\",\n\t\t\t\"pro"
    "tip\": \"\",\n\t\t\t\"imagePath\": \"https://s3-us-west-2.amazonaws.com/viking.appro"
    "vedfoodlistimages/protein%403x.png\",\n\t\t\t\"localImagePath\": \"pro"
    "tein\",\n\t\t\t\"categoryName\": \"Lean Protein\",\n\t\t\t\"colorCode\": \"#F16"
    "8A4\",\n\t\t\t\"servingSize\": \"4 Oz Servings\"\n\t\t}\n\t}]\n}";
