import 'package:tennis_app/src/app/tennis/domain/entities/weather_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/weather_repository.dart';

class WeatherRepositoryMock implements WeatherRepository {
  @override
  Future<WeatherForecastEntity> getForecastWeather(
      String location, String date, int? hour) {
    return Future.value(
      WeatherForecastEntity(
        current: const CurrentEntity(
          tempC: 10,
          lastUpdated: '232121',
          lastUpdatedEpoch: 32423,
          condition: ConditionEntity(
            text: 'sunny',
            icon: 'https://cdn.weatherapi.com/weather/64x64/night/176.png',
            code: 0,
          ),
        ),
        forecast: ForecastEntity(
          forecastday: [
            ForecastdayEntity(
              date: DateTime.parse("2024-10-26"),
              dateEpoch: 1729900800,
              hour: const [
                HourEntity(
                  tempC: 16,
                  condition: ConditionEntity(
                    text: 'sunny',
                    icon:
                        'https://cdn.weatherapi.com/weather/64x64/night/176.png',
                    code: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
