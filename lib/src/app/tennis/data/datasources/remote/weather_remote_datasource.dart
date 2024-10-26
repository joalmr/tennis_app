import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tennis_app/src/app/tennis/data/models/weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherForecastModel> getForecastWeather(
      String location, String date, int? hour);
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<WeatherForecastModel> getForecastWeather(
      String location, String date, int? hour) async {
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['WEATHER_KEY']!}&q=$location&days=14&dt=$date&hour=$hour');
    return WeatherForecastModel.fromJson(response.data);
  }
}
