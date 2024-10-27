import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/instructors_repository_mock.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/instructors_usecase.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/instructors_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = InstructorsProvider(
    instructorsUsecase:
        InstructorsUsecase(repository: InstructorsRepositoryMock()),
  );

  test('Obtener instructores', () {
    provider.getInstructors();
    expect(provider.instructors, isA<List<InstructorsEntity>>());
    expect(provider.instructors.isNotEmpty, isTrue);
  });
}
