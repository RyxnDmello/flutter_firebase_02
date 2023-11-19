import './daily/weather_daily_essentials_model.dart';
import './daily/weather_daily_hourly_model.dart';

class WeatherDailyModel {
  const WeatherDailyModel({
    required this.essentials,
    required this.hourly,
  });

  final List<WeatherDailyEssentialsModel> essentials;
  final List<WeatherDailyHourlyModel> hourly;
}
