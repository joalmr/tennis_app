import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_forecastday_entity.dart';

class WeatherForecastdayModel extends WeatherForecastdayEntity {
  const WeatherForecastdayModel({
    super.date,
    super.dateEpoch,
    super.hour,
  });

  factory WeatherForecastdayModel.fromJson(Map<String, dynamic> json) =>
      WeatherForecastdayModel(
        date: json['date'],
        dateEpoch: json['date_epoch'],
        hour: json['hour'],
      );
}
