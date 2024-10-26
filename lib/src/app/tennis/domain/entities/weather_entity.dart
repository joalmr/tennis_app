import 'package:equatable/equatable.dart';

class WeatherForecastEntity extends Equatable {
  final CurrentEntity? current;
  final ForecastEntity? forecast;

  const WeatherForecastEntity({
    this.current,
    this.forecast,
  });

  @override
  List<Object?> get props => [
        current,
        forecast,
      ];
}

class CurrentEntity extends Equatable {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final ConditionEntity? condition;

  const CurrentEntity({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.condition,
  });

  @override
  List<Object?> get props => [
        lastUpdatedEpoch,
        lastUpdated,
        tempC,
        condition,
      ];
}

class ForecastEntity extends Equatable {
  final List<ForecastdayEntity>? forecastday;

  const ForecastEntity({
    this.forecastday,
  });

  @override
  List<Object?> get props => [
        forecastday,
      ];
}

class ForecastdayEntity extends Equatable {
  final DateTime? date;
  final int? dateEpoch;
  final List<HourEntity>? hour;

  const ForecastdayEntity({
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

class HourEntity extends Equatable {
  final int? timeEpoch;
  final String? time;
  final double? tempC;
  final int? isDay;
  final ConditionEntity? condition;

  const HourEntity({
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

class ConditionEntity extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const ConditionEntity({
    this.text,
    this.icon,
    this.code,
  });

  @override
  List<Object?> get props => [
        text,
        icon,
        code,
      ];
}
