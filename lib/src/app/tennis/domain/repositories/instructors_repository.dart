import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';

abstract class InstructorsRepository {
  Future<List<InstructorsEntity>> getInstructors();
}
