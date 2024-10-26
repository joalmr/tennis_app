import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_condition_entity.dart';

class WeatherCurrentEntity extends Equatable {
  final double? tempC;
  final int? isDay;
  final WeatherConditionEntity? condition;

  const WeatherCurrentEntity({
    this.tempC,
    this.isDay,
    this.condition,
  });

  @override
  List<Object?> get props => [
        tempC,
        isDay,
        condition,
      ];
}
