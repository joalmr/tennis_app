import 'package:equatable/equatable.dart';

class WeatherConditionEntity extends Equatable {
  final String? text;
  final String? icon;
  final int? code;

  const WeatherConditionEntity({
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
