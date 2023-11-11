import './weather/weather_essentials_model.dart';

class Weather {
  const Weather({
    required this.essentials,
  });

  final List<WeatherEssentials> essentials;
}

const weather = Weather(essentials: [
  WeatherEssentials(
    blocks: [
      Blocks(
        image: "./lib/images/home/weather/rain.png",
        title: "Rain",
        value: "100%",
      ),
      Blocks(
        image: "./lib/images/home/weather/humidity.png",
        title: "Humidity",
        value: "85%",
      ),
      Blocks(
        image: "./lib/images/home/weather/wind.png",
        title: "Wind",
        value: "10ms",
      ),
    ],
  ),
  WeatherEssentials(
    blocks: [
      Blocks(
        image: "./lib/images/home/weather/rain.png",
        title: "Rain",
        value: "100%",
      ),
      Blocks(
        image: "./lib/images/home/weather/humidity.png",
        title: "Humidity",
        value: "85%",
      ),
      Blocks(
        image: "./lib/images/home/weather/rain.png",
        title: "Wind",
        value: "10ms",
      ),
    ],
  ),
  WeatherEssentials(
    blocks: [
      Blocks(
        image: "./lib/images/home/weather/rain.png",
        title: "Rain",
        value: "100%",
      ),
      Blocks(
        image: "./lib/images/home/weather/humidity.png",
        title: "Humidity",
        value: "85%",
      ),
      Blocks(
        image: "./lib/images/home/weather/rain.png",
        title: "Wind",
        value: "10ms",
      ),
    ],
  )
]);
