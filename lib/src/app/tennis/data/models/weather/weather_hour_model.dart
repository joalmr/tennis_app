import 'package:tennis_app/src/app/tennis/data/models/weather/weather_condition_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_hour_entity.dart';

class WeatherHourModel extends WeatherHourEntity {
  const WeatherHourModel({
    super.timeEpoch,
    super.time,
    super.tempC,
    super.isDay,
    super.condition,
  });

  factory WeatherHourModel.fromJson(Map<String, dynamic> json) {
    return WeatherHourModel(
      timeEpoch: json['time_epoch'],
      time: json['time'],
      tempC: json['temp_c'],
      isDay: json['is_day'],
      condition: WeatherConditionModel.fromJson(json['condition']),
    );
  }
}
