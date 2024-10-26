import 'package:tennis_app/src/app/tennis/data/datasources/remote/weather_remote_datasource.dart';
import 'package:tennis_app/src/app/tennis/domain/entities/weather/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDatasource remoteDatasource;

  WeatherRepositoryImpl({required this.remoteDatasource});

  @override
  Future<WeatherEntity> getForecastWeather(
      String location, String date, int? hour) async {
    return await remoteDatasource.getForecastWeather(location, date, hour);
  }
}
