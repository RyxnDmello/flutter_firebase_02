class WeatherDailyEssentialsModel {
  const WeatherDailyEssentialsModel({
    required this.blocks,
  });

  final List<EssentialBlockModel> blocks;
}

class EssentialBlockModel {
  const EssentialBlockModel({
    required this.image,
    required this.title,
    required this.value,
  });

  final String image;
  final String title;
  final String value;
}
