import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tennis_app/src/app/tennis/data/models/weather/weather_model.dart';

abstract class WeatherRemoteDatasource {
  Future<WeatherModel> getForecastWeather(
      String location, String date, int? hour);
}

class WeatherRemoteDatasourceImpl implements WeatherRemoteDatasource {
  final Dio dio = Dio();

  @override
  Future<WeatherModel> getForecastWeather(
      String location, String date, int? hour) async {
    final response = await dio.get(
        'http://api.weatherapi.com/v1/forecast.json?key=${dotenv.env['WEATHER_KEY']!}&q=$location&days=14&dt=$date&hour=$hour');
    return WeatherModel.fromJson(response.data);
  }
}
