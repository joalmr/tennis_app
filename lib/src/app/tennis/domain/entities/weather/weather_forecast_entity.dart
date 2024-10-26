import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_forecastday_entity.dart';

class WeatherForecastEntity extends Equatable {
  final List<WeatherForecastdayEntity>? forecastday;

  const WeatherForecastEntity({this.forecastday});

  @override
  List<Object?> get props => [
        forecastday,
      ];
}
