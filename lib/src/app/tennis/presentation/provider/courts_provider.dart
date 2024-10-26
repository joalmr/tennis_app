import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/courts_usecase.dart';

class CourtsProvider extends ChangeNotifier {
  final CourtsUsecase courtsUsecase;

  CourtsProvider({required this.courtsUsecase}) {
    getCourts();
  }

  List<CourtsEntity> courts = [];
  CourtsEntity? court;
  List<DdlTime> listTime = [];

  getCourts() async {
    courts = await courtsUsecase.getCourts();
    notifyListeners();
  }

  getCourt(int id) async {
    court = courts.firstWhere((element) => element.id == id);
    getListTime();
  }

  getListTime() {
    final times = court!.end! - court!.start!;

    listTime = <DdlTime>[
      for (var i = 0; i < times; i++)
        DdlTime(
          description: '${i + court!.start!}:00',
          value: i + court!.start!,
        )
    ];
  }
}

class DdlTime {
  final String description;
  final int value;
  DdlTime({required this.description, required this.value});
}
