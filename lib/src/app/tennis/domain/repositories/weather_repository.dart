import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherForecastEntity> getForecastWeather(
      String location, String date, int? hour);
}
