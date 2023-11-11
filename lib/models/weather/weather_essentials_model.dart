class WeatherEssentials {
  const WeatherEssentials({
    required this.blocks,
  });

  final List<Blocks> blocks;
}

class Blocks {
  const Blocks({
    required this.image,
    required this.title,
    required this.value,
  });

  final String image;
  final String title;
  final String value;
}
