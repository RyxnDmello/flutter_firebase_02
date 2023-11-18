import 'package:flutter/material.dart';

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
            height: 25,
          ),
          HomeWeatherTemperature(
            temperature: weather.temperature.temperature,
            image: weather.temperature.image,
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
            onOpenScreen: openWeeklyScreen,
          ),
          const SizedBox(
            height: 10,
          ),
          HomeWeatherDetailsButton(
            onOpenScreen: () {},
          ),
        ],
      ),
    );
  }
}
