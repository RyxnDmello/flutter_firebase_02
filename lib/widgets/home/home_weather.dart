import 'package:flutter/material.dart';

import '../../models/weather_model.dart';

import './weather/home_weather_location.dart';
import './weather/home_weather_temperature.dart';
import './weather/home_weather_essentials.dart';
import './weather/home_weather_hourly.dart';
import './weather/home_weather_weekly_button.dart';

import '../../screens/weekly.dart';

class HomeWeather extends StatefulWidget {
  const HomeWeather({super.key});

  @override
  State<HomeWeather> createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather>
    with TickerProviderStateMixin {
  int _hourlySlide = 0;

  void _openWeeklyScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WeeklyScreen(),
      ),
    );
  }

  void _switchHourlySlides(int currentSlide) {
    setState(() => _hourlySlide = currentSlide);
  }

  @override
  Widget build(BuildContext context) {
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
            onSlideChanged: _switchHourlySlides,
            currentSlide: _hourlySlide,
            hourly: weather.hourly,
            tabVsync: this,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeWeatherWeeklyButton(
            openScreen: _openWeeklyScreen,
          ),
        ],
      ),
    );
  }
}
