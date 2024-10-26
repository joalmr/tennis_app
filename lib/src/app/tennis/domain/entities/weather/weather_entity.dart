import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_current_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_forecast_entity.dart';

class WeatherEntity extends Equatable {
  final WeatherCurrentEntity? current;
  final WeatherForecastEntity? forecast;

  const WeatherEntity({
    this.current,
    this.forecast,
  });

  @override
  List<Object?> get props => [
        current,
        forecast,
      ];
}
