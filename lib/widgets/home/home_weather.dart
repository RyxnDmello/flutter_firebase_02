import 'package:flutter/material.dart';

import '../../models/weather_model.dart';

import './weather/home_weather_location.dart';
import './weather/home_weather_temperature.dart';
import './weather/home_weather_essentials.dart';
import './weather/home_weather_hourly.dart';
import './weather/home_weather_weekly_button.dart';

import '../../screens/weekly.dart';

class HomeWeather extends StatelessWidget {
  const HomeWeather({super.key});

  @override
  Widget build(BuildContext context) {
    void openWeeklyScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const WeeklyScreen(
            weather: weather,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HomeWeatherLocation(
            location: "Toronto Ontario",
          ),
          const SizedBox(
            height: 25,
          ),
          const HomeWeatherTemperature(
            temperature: "36",
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherEssentials(
            essentials: weather.essentials,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherHourly(
            hourly: weather.hourly,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherWeeklyButton(
            openScreen: openWeeklyScreen,
          ),
        ],
      ),
    );
  }
}
