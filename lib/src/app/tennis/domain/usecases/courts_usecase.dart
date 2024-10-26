import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/courts_repository.dart';

class CourtsUsecase {
  final CourtsRepository repository;

  CourtsUsecase({required this.repository});

  Future<List<CourtsEntity>> getCourts() async {
    return repository.getCourts();
  }
}
