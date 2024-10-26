import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/weather_repository.dart';

class WeatherUsecase {
  final WeatherRepository repository;

  WeatherUsecase({required this.repository});

  Future<WeatherEntity> getForecastWeather(
      String location, String date, int? hour) async {
    return repository.getForecastWeather(location, date, hour);
  }
}
