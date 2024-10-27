import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/courts_repository_mock.dart';
import 'package:tennis_app/src/app/tennis/data/repositories/weather_repository_mock.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/courts_usecase.dart';
import 'package:tennis_app/src/app/tennis/domain/usecases/weather_usecase.dart';
import 'package:tennis_app/src/app/tennis/presentation/provider/courts_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final provider = CourtsProvider(
      courtsUsecase: CourtsUsecase(
        repository: CourtsRepositoryMock(),
      ),
      weatherUsecase: WeatherUsecase(
        repository: WeatherRepositoryMock(),
      ));

  group('CourtsProvider', () {
    test('Obtener canchas', () async {
      await provider.getCourts();
      expect(provider.courts, isA<List<CourtsEntity>>());
      expect(provider.courts.isNotEmpty, isTrue);
    });

    test('Obtener cancha por id', () async {
      await provider.getCourt(1);
      expect(provider.court, isA<CourtsEntity>());
      expect(provider.court!.name!, 'Court 1');
    });

    test('Obtener estado del clima', () async {
      final response =
          await provider.getForecastWeather('Lima', '2022-01-01', 9);
      expect(response, isA<WeatherForecastEntity>());
      expect(response.current!, isA<CurrentEntity>());
      expect(response.current!.tempC!, isA<double>());
      expect(response.forecast!, isA<ForecastEntity>());
      expect(response.forecast!.forecastday!.first.hour!.first.tempC!,
          isA<double>());
    });
  });
}
