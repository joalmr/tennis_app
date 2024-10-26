import 'package:tennis_app/src/app/tennis/data/models/weather/weather_current_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.current,
    super.forecast,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      current: WeatherCurrentModel.fromJson(json['current']),
      // forecast: WeatherForecastModel.fromJson(json['forecast']),
    );
  }
}
