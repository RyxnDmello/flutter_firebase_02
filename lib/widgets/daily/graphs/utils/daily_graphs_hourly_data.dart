import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

List<WeatherDailyHourlyModel> getHourlyData(
  List<WeatherDailyHourlyModel> hourly,
) {
  List<WeatherDailyHourlyModel> graphPoints = [];

  if (DateTime.now().hour > 12) {
    for (var i = 12; i < 24; i++) {
      graphPoints.add(hourly[i]);
    }

    return graphPoints;
  }

  for (var i = 0; i < 12; i++) {
    graphPoints.add(hourly[i]);
  }

  return graphPoints;
}
