import './daily/weather_daily_essentials_model.dart';
import './daily/weather_daily_hourly_model.dart';

import './weather_location_model.dart';
import './weather_temperature_model.dart';

class WeatherDailyModel {
  const WeatherDailyModel({
    required this.location,
    required this.temperature,
    required this.essentials,
    required this.hourly,
  });

  final WeatherLocationModel location;
  final WeatherTemperatureModel temperature;
  final List<WeatherDailyEssentialsModel> essentials;
  final List<WeatherDailyHourlyModel> hourly;
}
