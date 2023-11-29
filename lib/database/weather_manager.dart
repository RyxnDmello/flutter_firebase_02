import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

import '../models/weather_model.dart';

import '../models/weather/weather_location_model.dart';
import '../models/weather/weather_temperature_model.dart';
import '../models/weather/weather_weekly_model.dart';
import '../models/weather/weather_daily_model.dart';

import '../models/weather/daily/weather_daily_essentials_model.dart';
import '../models/weather/daily/weather_daily_hourly_model.dart';

class _WeatherManager {
  _WeatherManager()
      : _weatherData = null,
        _weatherModel = null;

  WeatherModel? _weatherModel;
  Map? _weatherData;

  Future<bool> initializeWeather({required String location}) async {
    final String apiUri = "${dotenv.env['WEATHER_API_URI']}/$location/";
    final String apiQuery = "${dotenv.env['WEATHER_API_QUERY']}";
    final String apiKey = "${dotenv.env['WEATHER_API_KEY']}";
    final String apiPath = "$apiUri$apiQuery$apiKey";

    final response = await Dio().get(apiPath);

    if (response.statusCode != null && response.statusCode! > 299) return false;
    _weatherData = response.data as Map;

    return true;
  }

  WeatherModel? weather() {
    if (_weatherData == null) return null;

    _weatherModel = WeatherModel(
      location: WeatherLocationModel(
        date: _formattedDate(_weatherData!["days"][0]["datetime"]),
        location: _weatherData!["resolvedAddress"],
      ),
      temperature: WeatherTemperatureModel(
        temperature: _weatherData!["days"][0]["temp"].toString(),
        condition: _weatherData!["days"][0]["conditions"],
        image: "./lib/images/weather/clear-day.png",
      ),
      weekly: [
        ..._weatherData!["days"].map((day) {
          return WeatherWeeklyModel(
            day: _formattedDate(day["datetime"], "EEEE"),
            image: "./lib/images/weather/clear-day.png",
            date: _formattedDate(day["datetime"]),
            temperature: day["temp"].toString(),
            condition: day["conditions"],
          );
        }),
      ],
      daily: [
        ..._weatherData!["days"].map((day) {
          return WeatherDailyModel(
            location: WeatherLocationModel(
              date: _formattedDate(day["datetime"], "d MMM, EEEE"),
              location: _weatherData!["resolvedAddress"],
            ),
            temperature: WeatherTemperatureModel(
              image: "./lib/images/weather/clear-day.png",
              temperature: day["temp"].toString(),
              condition: day["conditions"],
            ),
            essentials: [
              WeatherDailyEssentialsModel(
                blocks: [
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/rain.png",
                    value: day["precipprob"].toString(),
                    title: "Rain",
                  ),
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/humidity.png",
                    value: day["humidity"].toString(),
                    title: "Humidity",
                  ),
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/wind.png",
                    value: day["windspeed"].toString(),
                    title: "Wind",
                  ),
                ],
              ),
              WeatherDailyEssentialsModel(
                blocks: [
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/dew.png",
                    value: day["dew"].toString(),
                    title: "Dew",
                  ),
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/pressure.png",
                    value: day["pressure"].toString(),
                    title: "Pressure",
                  ),
                  EssentialBlockModel(
                    image: "./lib/images/weather/essentials/cloud.png",
                    value: day["cloudcover"].toString(),
                    title: "Cover",
                  ),
                ],
              ),
            ],
            hourly: [
              ...day["hours"].map((hour) {
                return WeatherDailyHourlyModel(
                  hour: _getHour(hour["datetime"]),
                  image: "./lib/images/weather/clear-day.png",
                  precipitation: hour["precipprob"].toString(),
                  humidity: hour["humidity"].toString(),
                  pressure: hour["pressure"].toString(),
                  temperature: hour["temp"].toString(),
                  cover: hour["cloudcover"].toString(),
                  wind: hour["windspeed"].toString(),
                  dew: hour["dew"].toString(),
                );
              }),
            ],
          );
        }),
      ],
    );

    return _weatherModel;
  }
}

String _formattedDate(String date, [String pattern = "d MMM"]) {
  return DateFormat(pattern).format(DateTime.parse(date));
}

String _getHour(String hour) {
  return hour.substring(0, 2);
}

final weatherManager = _WeatherManager();
