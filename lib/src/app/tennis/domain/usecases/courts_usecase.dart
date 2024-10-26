import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/favorite_courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/courts_repository.dart';

class CourtsUsecase {
  final CourtsRepository repository;

  CourtsUsecase({required this.repository});

  Future<List<CourtsEntity>> getCourts() {
    return repository.getCourts();
  }

  Future<void> favoriteCourt(String idCustomer, int idCourt) {
    return repository.favoriteCourt(idCustomer, idCourt);
  }

  Future<List<FavoriteCourtsEntity>> getFavoriteCourts(String idCustomer) {
    return repository.getFavoriteCourts(idCustomer);
  }
}
