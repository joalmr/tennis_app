import 'package:flutter/material.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/favorite_courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/courts_usecase.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/weather_usecase.dart';

class CourtsProvider extends ChangeNotifier {
  final CourtsUsecase courtsUsecase;
  final WeatherUsecase weatherUsecase;

  CourtsProvider({
    required this.courtsUsecase,
    required this.weatherUsecase,
  }) {
    getCourts();
    // getFavoriteCourts();
  }

  List<CourtsEntity> courts = [];
  CourtsEntity? court;
  List<DdlTime> listTime = [];
  List<FavoriteCourtsEntity> favoriteCourts = [];

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

  // putFavorite(int idCourt) async {
  //   await courtsUsecase.favoriteCourt(MyStorage().uid, idCourt);
  //   getFavoriteCourts();
  //   notifyListeners();
  // }

  // getFavoriteCourts() async {
  //   favoriteCourts = await courtsUsecase.getFavoriteCourts(MyStorage().uid);
  //   notifyListeners();
  // }

  // bool isFavorite(int idCourt) {
  //   return favoriteCourts
  //           .where((element) => element.courts!.id == idCourt)
  //           .isNotEmpty
  //       ? true
  //       : false;
  // }
}

class DdlTime {
  final String description;
  final int value;
  DdlTime({required this.description, required this.value});
}
