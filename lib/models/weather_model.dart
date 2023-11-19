import 'package:intl/intl.dart';

import './weather/daily/weather_daily_essentials_model.dart';
import './weather/daily/weather_daily_hourly_model.dart';

import './weather/weather_location_model.dart';
import './weather/weather_temperature_model.dart';
import './weather/weather_weekly_model.dart';
import './weather/weather_daily_model.dart';

class Weather {
  const Weather({
    required this.location,
    required this.temperature,
    required this.weekly,
    required this.daily,
  });

  final WeatherLocationModel location;
  final WeatherTemperatureModel temperature;
  final List<WeatherWeeklyModel> weekly;
  final List<WeatherDailyModel> daily;
}

final weather = Weather(
  location: WeatherLocationModel(
    location: "Toronto Ontario",
    date: DateFormat("d MMM").format(DateTime.now()),
  ),
  temperature: const WeatherTemperatureModel(
    temperature: "36",
    image: "./lib/images/weather/clear-day.png",
  ),
  weekly: [
    const WeatherWeeklyModel(
      image: "./lib/images/weather/clear-day.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/clear-night.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/cloudy.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/hail.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/rain.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/snow-showers.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
    const WeatherWeeklyModel(
      image: "./lib/images/weather/snow.png",
      condition: "Partially Cloudy",
      temperature: "36°",
      day: "Thursday",
      date: "16 Nov",
    ),
  ],
  daily: [
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
    const WeatherDailyModel(
      essentials: [
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/rain.png",
              title: "Rain",
              value: "100%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/humidity.png",
              title: "Humidity",
              value: "85%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/wind.png",
              title: "Wind",
              value: "10ms",
            ),
          ],
        ),
        WeatherDailyEssentialsModel(
          blocks: [
            EssentialsModel(
              image: "./lib/images/home/weather/dew.png",
              title: "Dew",
              value: "20.8%",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/pressure.png",
              title: "Pressure",
              value: "1012.4mb",
            ),
            EssentialsModel(
              image: "./lib/images/home/weather/cloud.png",
              title: "Cover",
              value: "50.2%",
            ),
          ],
        ),
      ],
      hourly: [
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
        WeatherDailyHourlyModel(
          image: "./lib/images/home/weather/humidity.png",
          hour: "10Am",
          value: "26°",
        ),
      ],
    ),
  ],
);
