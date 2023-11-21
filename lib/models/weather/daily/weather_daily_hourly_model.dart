class WeatherDailyHourlyModel {
  const WeatherDailyHourlyModel({
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.pressure,
    required this.cover,
    required this.wind,
    required this.dew,
    required this.image,
    required this.hour,
  });

  final String temperature;
  final String precipitation;
  final String humidity;
  final String pressure;
  final String cover;
  final String wind;
  final String dew;
  final String image;
  final String hour;
}

enum HourlyWeatherType {
  temperature,
  precipitation,
  humidity,
  wind,
  dew,
  pressure,
  cover,
}
