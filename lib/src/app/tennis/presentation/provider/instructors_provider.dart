import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/instructors_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/instructors_usecase.dart';

class InstructorsProvider extends ChangeNotifier {
  final InstructorsUsecase instructorsUsecase;

  InstructorsProvider({required this.instructorsUsecase}) {
    getInstructors();
  }

  List<InstructorsEntity> instructors = [];
  List<DdlInstructor> listInstructors = [];

  getInstructors() async {
    instructors = await instructorsUsecase.getInstructors();
    Logger().w(instructors, error: 'getInstructors');
    listInstructors = <DdlInstructor>[
      for (var item in instructors)
        DdlInstructor(description: item.name!, value: item.id!)
    ];
    notifyListeners();
  }
}

class DdlInstructor {
  final String description;
  final int value;
  DdlInstructor({required this.description, required this.value});
}
