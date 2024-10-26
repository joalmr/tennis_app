import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_condition_entity.dart';

class WeatherConditionModel extends WeatherConditionEntity {
  const WeatherConditionModel({
    super.text,
    super.icon,
    super.code,
  });

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
