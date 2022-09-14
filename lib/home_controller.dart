import 'home_model.dart';
import 'home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);
  Future<HomeModel> loadData() async {
    final result = _homeRepository.getData();
    return result;
  }
}
