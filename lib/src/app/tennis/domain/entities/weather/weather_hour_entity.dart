import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_condition_entity.dart';

class WeatherHourEntity extends Equatable {
  final int? timeEpoch;
  final String? time;
  final double? tempC;
  final int? isDay;
  final WeatherConditionEntity? condition;

  const WeatherHourEntity({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.isDay,
    this.condition,
  });

  @override
  List<Object?> get props => [
        timeEpoch,
        time,
        tempC,
        isDay,
        condition,
      ];
}
