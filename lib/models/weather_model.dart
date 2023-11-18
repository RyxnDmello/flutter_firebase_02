import 'package:intl/intl.dart';

import './weather/weather_location_model.dart';
import './weather/weather_temperature_model.dart';
import './weather/weather_essentials_model.dart';
import './weather/weather_hourly_model.dart';
import './weather/weather_weekly_model.dart';

class Weather {
  const Weather({
    required this.location,
    required this.temperature,
    required this.essentials,
    required this.hourly,
    required this.weekly,
  });

  final WeatherLocation location;
  final WeatherTemperature temperature;
  final List<WeatherEssentials> essentials;
  final List<WeatherHourly> hourly;
  final List<WeatherWeekly> weekly;
}

final weather = Weather(
  location: WeatherLocation(
    location: "Toronto Ontario",
    date: DateFormat("d MMM").format(DateTime.now()),
  ),
  temperature: const WeatherTemperature(
    temperature: "36",
    image: "./lib/images/weather/clear-day.png",
  ),
  essentials: [
    const WeatherEssentials(
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
    const WeatherEssentials(
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
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
    const WeatherHourly(
      image: "./lib/images/home/weather/humidity.png",
      hour: "10Am",
      value: "26°",
    ),
  ],
  weekly: [
    const WeatherWeekly(
      image: "./lib/images/weather/clear-day.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/clear-night.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/cloudy.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/hail.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/rain.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/snow-showers.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeekly(
      image: "./lib/images/weather/snow.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
  ],
);
