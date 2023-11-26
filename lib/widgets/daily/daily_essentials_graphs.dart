import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './graphs/utils/daily_graphs_modal_header.dart';

import './graphs/daily_graphs_line.dart';
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
          DailyGraphsModalHeader(
            title: weatherType.name,
          ),
          const SizedBox(
            height: 25,
          ),
          DailyGraphsLine(
            graphMax: weatherType == HourlyWeatherType.pressure ? 1500 : 100,
            barColor: const Color.fromARGB(255, 0, 0, 225),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
          const SizedBox(
            height: 60,
          ),
          DailyGraphsBar(
            graphMax: weatherType == HourlyWeatherType.pressure ? 1500 : 100,
            barColor: const Color.fromARGB(255, 255, 0, 50),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
          const SizedBox(
            height: 65,
          ),
          DailyGraphsPie(
            sectionsColor: const Color.fromARGB(255, 0, 255, 125),
            weatherType: weatherType,
            graphTitle: null,
            hourly: hourly,
          ),
        ],
      ),
    );
  }
}
