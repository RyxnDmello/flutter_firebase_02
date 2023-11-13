import './weather/weather_essentials_model.dart';
import './weather/weather_hourly_model.dart';

class Weather {
  const Weather({
    required this.essentials,
    required this.hourly,
  });

  final List<WeatherEssentials> essentials;
  final List<WeatherHourly> hourly;
}

const weather = Weather(
  essentials: [
    WeatherEssentials(
      blocks: [
        EssentialsBlock(
          image: "./lib/images/home/weather/rain.png",
          title: "Rain",
          value: "100%",
        ),
        EssentialsBlock(
          image: "./lib/images/home/weather/humidity.png",
          title: "Humidity",
          value: "85%",
        ),
        EssentialsBlock(
          image: "./lib/images/home/weather/wind.png",
          title: "Wind",
          value: "10ms",
        ),
      ],
    ),
    WeatherEssentials(
      blocks: [
        EssentialsBlock(
          image: "./lib/images/home/weather/dew.png",
          title: "Dew",
          value: "20.8%",
        ),
        EssentialsBlock(
          image: "./lib/images/home/weather/pressure.png",
          title: "Pressure",
          value: "1012.4mb",
        ),
        EssentialsBlock(
          image: "./lib/images/home/weather/cloud.png",
          title: "Cover",
          value: "50.2%",
        ),
      ],
    ),
  ],
  hourly: [
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
  ],
);
