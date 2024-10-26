import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_forecast_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  const WeatherForecastModel({
    super.forecastday,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      forecastday: json['forecastday'],
    );
  }
}
