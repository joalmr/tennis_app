import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';

class WeatherForecastModel extends WeatherForecastEntity {
  const WeatherForecastModel({
    super.current,
    super.forecast,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) =>
      WeatherForecastModel(
        current: json["current"] == null
            ? null
            : CurrentModel.fromJson(json["current"]),
        forecast: json["forecast"] == null
            ? null
            : ForecastModel.fromJson(json["forecast"]),
      );
}

class CurrentModel extends CurrentEntity {
  const CurrentModel({
    super.lastUpdatedEpoch,
    super.lastUpdated,
    super.tempC,
    super.condition,
  });

  factory CurrentModel.fromJson(Map<String, dynamic> json) => CurrentModel(
        lastUpdatedEpoch: json["last_updated_epoch"],
        lastUpdated: json["last_updated"],
        tempC: json["temp_c"]?.toDouble(),
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
      );
}

class ForecastModel extends ForecastEntity {
  const ForecastModel({
    super.forecastday,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) => ForecastModel(
        forecastday: json["forecastday"] == null
            ? []
            : List<ForecastdayModel>.from(
                json["forecastday"]!.map((x) => ForecastdayModel.fromJson(x))),
      );
}

class ForecastdayModel extends ForecastdayEntity {
  const ForecastdayModel({
    super.date,
    super.dateEpoch,
    super.hour,
  });

  factory ForecastdayModel.fromJson(Map<String, dynamic> json) =>
      ForecastdayModel(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateEpoch: json["date_epoch"],
        hour: json["hour"] == null
            ? []
            : List<HourModel>.from(
                json["hour"]!.map((x) => HourModel.fromJson(x))),
      );
}

class HourModel extends HourEntity {
  const HourModel({
    super.timeEpoch,
    super.time,
    super.tempC,
    super.isDay,
    super.condition,
  });

  factory HourModel.fromJson(Map<String, dynamic> json) => HourModel(
        timeEpoch: json["time_epoch"],
        time: json["time"],
        tempC: json["temp_c"]?.toDouble(),
        isDay: json["is_day"],
        condition: json["condition"] == null
            ? null
            : ConditionModel.fromJson(json["condition"]),
      );
}

class ConditionModel extends ConditionEntity {
  const ConditionModel({
    super.text,
    super.icon,
    super.code,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) => ConditionModel(
        text: json["text"],
        icon: json["icon"],
        code: json["code"],
      );
}
