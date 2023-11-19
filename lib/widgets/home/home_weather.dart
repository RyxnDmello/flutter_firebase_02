import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/screens/daily.dart';

import '../../models/weather_model.dart';

import './weather/home_weather_location.dart';
import './weather/home_weather_temperature.dart';
import './weather/home_weather_essentials.dart';
import './weather/home_weather_hourly.dart';
import './weather/home_weather_weekly_button.dart';
import './weather/home_weather_details_button.dart';

import '../../screens/weekly.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key});

  @override
  Widget build(BuildContext context) {
    void openWeeklyScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WeeklyScreen(
            weather: weather,
          ),
        ),
      );
    }

    void openDailyScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return DailyScreen(
              day: weather.daily[0],
            );
          },
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeWeatherLocation(
            location: weather.location.location,
            date: weather.location.date,
          ),
          const SizedBox(
            height: 30,
          ),
          HomeWeatherTemperature(
            temperature: weather.temperature.temperature,
            image: weather.temperature.image,
          ),
          const SizedBox(
            height: 30,
          ),
          HomeWeatherEssentials(
            essentials: weather.daily[0].essentials,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherHourly(
            hourly: weather.daily[0].hourly,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherWeeklyButton(
            onOpenScreen: openWeeklyScreen,
          ),
          const SizedBox(
            height: 10,
          ),
          HomeWeatherDetailsButton(
            onOpenScreen: openDailyScreen,
          ),
        ],
      ),
    );
  }
}
