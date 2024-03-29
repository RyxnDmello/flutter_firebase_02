class WeatherLocationModel {
  WeatherLocationModel({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.date,
  });

  final String location;
  final String latitude;
  final String longitude;
  final String timezone;
  final String date;
}
