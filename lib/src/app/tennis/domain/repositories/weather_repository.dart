import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getForecastWeather(
      String location, String date, int? hour);
}
