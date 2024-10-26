import 'package:equatable/equatable.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_hour_entity.dart';

class WeatherForecastdayEntity extends Equatable {
  final DateTime? date;
  final int? dateEpoch;
  final List<WeatherHourEntity>? hour;

  const WeatherForecastdayEntity({
    this.date,
    this.dateEpoch,
    this.hour,
  });

  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        hour,
      ];
}
