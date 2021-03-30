import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quovantis_assignment/bloc/bloc.dart';
import 'package:quovantis_assignment/models/models.dart';
import 'package:quovantis_assignment/repositories/repositories.dart';

class MenuBloc extends Bloc<FoodMenuEvent, MenuState> {
  final MenuRepository repository;

  MenuBloc({@required this.repository}) : assert(repository != null);

  @override
  MenuState get initialState => MenuEmpty();

  @override
  Stream<MenuState> mapEventToState(FoodMenuEvent event) async* {
    if (event is FetchFoodMenu) {
      yield MenuLoading();
      try {
        FoodMenu menu;
        menu = await repository.fetchMenu();
        yield MenuLoaded(menu: menu);
      } catch (_) {
        yield MenuError();
      }
    }
  }
}
