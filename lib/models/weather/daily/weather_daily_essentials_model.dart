class WeatherDailyEssentialsModel {
  const WeatherDailyEssentialsModel({
    required this.blocks,
  });

  final List<EssentialsModel> blocks;
}

class EssentialsModel {
  const EssentialsModel({
    required this.image,
    required this.title,
    required this.value,
  });

  final String image;
  final String title;
  final String value;
}
