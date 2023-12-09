class FavoriteModel {
  const FavoriteModel({
    required this.id,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.timezone,
  });

  final String id;
  final String location;
  final String latitude;
  final String longitude;
  final String timezone;
}
