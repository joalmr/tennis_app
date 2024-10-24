import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';

abstract class CourtsRepository {
  Future<List<CourtsEntity>> getCourts();
}
