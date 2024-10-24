import 'package:tennis_app/src/app/tennis/data/datasources/remote/courts_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/courts_repository.dart';

class CourtsRepositoryImpl implements CourtsRepository {
  final CourtsRemoteDatasource remoteDatasource;

  CourtsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<CourtsEntity>> getCourts() async {
    return await remoteDatasource.getCourts();
  }
}
