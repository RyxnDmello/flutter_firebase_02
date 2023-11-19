class WeatherWeeklyModel {
  const WeatherWeeklyModel({
    required this.temperature,
    required this.condition,
    required this.image,
    required this.date,
    required this.day,
  });

  final String temperature;
  final String condition;
  final String image;
  final String date;
  final String day;
}
