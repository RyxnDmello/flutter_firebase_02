import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './graphs/daily_graphs_bar.dart';

class DailyGraphs extends StatelessWidget {
  const DailyGraphs({
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DailyGraphsBar(
          weatherType: HourlyWeatherType.temperature,
          barColor: const Color.fromARGB(255, 225, 0, 60),
          graphTitle: "Temperature Graph",
          hourly: hourly,
          sidePadding: 5,
        ),
        const SizedBox(
          height: 40,
        ),
        DailyGraphsBar(
          barColor: const Color.fromARGB(255, 0, 0, 225),
          weatherType: HourlyWeatherType.precipitation,
          graphTitle: "Precipitation Graph",
          hourly: hourly,
          sidePadding: 5,
        ),
      ],
    );
  }
}
