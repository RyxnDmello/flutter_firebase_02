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
  const _WeatherManager();

  Future<WeatherModel?> weather({required String location}) async {
    final weatherData = await _weatherData(location: location);

    if (weatherData == null) return null;

    return WeatherModel(
      location: WeatherLocationModel(
        date: _formattedDate(weatherData["days"][0]["datetime"]),
        longitude: weatherData["longitude"].toString(),
        latitude: weatherData["latitude"].toString(),
        location: weatherData["resolvedAddress"],
        timezone: weatherData["timezone"],
      ),
      temperature: WeatherTemperatureModel(
        temperature: weatherData["days"][0]["temp"].toString(),
        condition: weatherData["days"][0]["conditions"],
        image: "./lib/images/weather/clear-day.png",
      ),
      weekly: [
        ...weatherData["days"].map((day) {
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
        ...weatherData["days"].map((day) {
          return WeatherDailyModel(
            location: WeatherLocationModel(
              date: _formattedDate(day["datetime"], "d MMM, EEEE"),
              longitude: weatherData["longitude"].toString(),
              latitude: weatherData["latitude"].toString(),
              location: weatherData["resolvedAddress"],
              timezone: weatherData["timezone"],
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
  }

  Future<Map?> _weatherData({required String location}) async {
    final api = _api(location: location);

    try {
      final response = await Dio().get(api);
      return response.data as Map;
    } on DioException {
      return null;
    }
  }

  String _api({required String location}) {
    final String apiUri = "${dotenv.env['WEATHER_API_URI']}/$location/";
    final String apiQuery = "${dotenv.env['WEATHER_API_QUERY']}";
    final String apiKey = "${dotenv.env['WEATHER_API_KEY']}";
    return "$apiUri$apiQuery$apiKey";
  }
}

String _formattedDate(String date, [String pattern = "d MMM"]) {
  return DateFormat(pattern).format(DateTime.parse(date));
}

String _getHour(String hour) {
  return hour.substring(0, 2);
}

const weatherManager = _WeatherManager();
