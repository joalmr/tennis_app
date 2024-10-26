import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/instructors_repository.dart';

class InstructorsUsecase {
  final InstructorsRepository repository;

  InstructorsUsecase({required this.repository});

  Future<List<InstructorsEntity>> getInstructors() {
    return repository.getInstructors();
  }
}
