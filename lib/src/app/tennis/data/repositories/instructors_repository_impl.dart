import 'package:tennis_app/src/app/tennis/data/datasources/remote/instructors_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/instructors_repository.dart';

class InstructorsRepositoryImpl implements InstructorsRepository {
  final InstructorsRemoteDatasource remoteDatasource;

  InstructorsRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<InstructorsEntity>> getInstructors() async {
    return await remoteDatasource.getInstructors();
  }
}
