import 'package:tennis_app/src/app/tennis/data/models/weather/weather_condition_model.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_current_entity.dart';

class WeatherCurrentModel extends WeatherCurrentEntity {
  const WeatherCurrentModel({
    super.tempC,
    super.isDay,
    super.condition,
  });

  factory WeatherCurrentModel.fromJson(Map<String, dynamic> json) {
    return WeatherCurrentModel(
      tempC: json['temp_c'],
      isDay: json['is_day'],
      condition: WeatherConditionModel.fromJson(json['condition']),
    );
  }
}
