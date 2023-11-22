import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './graphs/daily_graphs_bar.dart';

class DailyEssentialsGraphs extends StatelessWidget {
  const DailyEssentialsGraphs({
    required this.weatherType,
    required this.hourly,
    required this.title,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DailyGraphsBar(
            barColor: const Color.fromARGB(255, 0, 0, 225),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
          const SizedBox(
            height: 25,
          ),
          DailyGraphsBar(
            barColor: const Color.fromARGB(255, 0, 0, 225),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
        ],
      ),
    );
  }
}
