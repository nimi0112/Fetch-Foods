import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quovantis_assignment/bloc/bloc.dart';
import 'package:quovantis_assignment/models/models.dart';
import 'package:quovantis_assignment/repositories/repositories.dart';

class MockQuoteRepository extends Mock implements MenuRepository {}

void main() {
  MenuBloc quoteBloc;
  MockQuoteRepository quoteRepository;

  setUp(() {
    quoteRepository = MockQuoteRepository();
    quoteBloc = MenuBloc(repository: quoteRepository);
  });

  tearDown(() {
    quoteBloc?.close();
  });

  test('should assert if null', () {
    expect(
      () => MenuBloc(repository: null),
      throwsA(isAssertionError),
    );
  });

  test('initial state is correct', () {
    expect(quoteBloc.initialState, MenuEmpty());
  });

  test('close does not emit new states', () {
    expectLater(
      quoteBloc,
      emitsInOrder([MenuEmpty(), emitsDone]),
    );
    quoteBloc.close();
  });

  group('Bloc test', () {
    final mockMenu = FoodMenu(categories: [
      CategoryElement(
          category: Category(
              categoryName: 'Lean Protein',
              colorCode: '#F168A4',
              imagePath: "imagePath",
              localImagePath: "protein",
              protip: "Run this test",
              quote: "Maintain Social distancing",
              servingSize: "1 TON",
              subcategories: []))
    ]);

    blocTest(
      'emits [QuoteEmpty, QuoteLoading, QuoteLoaded] when FetchQuote is added and fetchQuote succeeds',
      build: () {
        when(quoteRepository.fetchMenu()).thenAnswer(
          (_) => Future.value(mockMenu),
        );
        return quoteBloc;
      },
      act: (bloc) => bloc.add(FetchFoodMenu()),
      expect: [MenuEmpty(), MenuLoading(), MenuLoaded(menu: mockMenu)],
    );

    blocTest(
      'emits [QuoteEmpty, QuoteLoading, QuoteError] when FetchQuote is added and fetchQuote fails',
      build: () {
        when(quoteRepository.fetchMenu()).thenThrow(Exception('error getting quotes'));
        return quoteBloc;
      },
      act: (bloc) => bloc.add(FetchFoodMenu()),
      expect: [MenuEmpty(), MenuLoading(), MenuError()],
    );
  });
}
