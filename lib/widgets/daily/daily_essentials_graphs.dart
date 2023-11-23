import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './essentials/graphs/daily_essentials_graphs_title.dart';
import './essentials/graphs/daily_essentials_graphs_exit.dart';

import './graphs/daily_graphs_bar.dart';
import './graphs/daily_graphs_pie.dart';

class DailyEssentialsGraphs extends StatelessWidget {
  const DailyEssentialsGraphs({
    required this.weatherType,
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DailyEssentialsGraphsTitle(
                title: weatherType.name,
              ),
              DailyEssentialsGraphsExit(
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
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
          const SizedBox(
            height: 60,
          ),
          DailyGraphsPie(
            graphColor: const Color.fromARGB(255, 0, 0, 225),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
        ],
      ),
    );
  }
}
