import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/courts_usecase.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/weather_usecase.dart';
import 'package:tennis_app/src/shared/storage.data.dart';

class CourtsProvider extends ChangeNotifier {
  final CourtsUsecase courtsUsecase;
  final WeatherUsecase weatherUsecase;

  CourtsProvider({
    required this.courtsUsecase,
    required this.weatherUsecase,
  }) {
    getCourts();
    getFavoriteCourts(MyStorage().uid);
  }

  List<CourtsEntity> courts = [];
  CourtsEntity? court;
  List<DdlTime> listTime = [];

  Future<WeatherForecastEntity> getForecastWeather(
      String location, String date, int? hour) async {
    return await weatherUsecase.getForecastWeather(location, date, hour);
  }

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

  putFavorite(String idCustomer, int idCourt) async {
    await courtsUsecase.favoriteCourt(idCustomer, idCourt);
    notifyListeners();
  }

  getFavoriteCourts(String idCustomer) async {
    await courtsUsecase.getFavoriteCourts(idCustomer);
  }
}

class DdlTime {
  final String description;
  final int value;
  DdlTime({required this.description, required this.value});
}
