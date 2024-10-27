import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/instructors_repository.dart';

class InstructorsRepositoryMock implements InstructorsRepository {
  @override
  Future<List<InstructorsEntity>> getInstructors() {
    return Future.value([
      const InstructorsEntity(
        id: 1,
        name: 'John Doe',
      ),
      const InstructorsEntity(
        id: 2,
        name: 'Jane Doe',
      )
    ]);
  }
}
