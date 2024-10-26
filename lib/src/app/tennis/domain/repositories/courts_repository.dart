import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/favorite_courts_entity.dart';

abstract class CourtsRepository {
  Future<List<CourtsEntity>> getCourts();
  Future<void> favoriteCourt(String idCustomer, int idCourt);
  Future<List<FavoriteCourtsEntity>> getFavoriteCourts(String idCustomer);
}
