class WeatherEssentials {
  const WeatherEssentials({
    required this.blocks,
  });

  final List<EssentialsBlock> blocks;
}

class EssentialsBlock {
  const EssentialsBlock({
    required this.image,
    required this.title,
    required this.value,
  });

  final String image;
  final String title;
  final String value;
}
