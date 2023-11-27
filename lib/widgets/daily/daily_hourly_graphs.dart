import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './hourly/graphs/daily_hourly_graphs_carousel.dart';
import './graphs/utils/daily_graphs_modal_header.dart';

class DailyHourlyGraphs extends StatelessWidget {
  const DailyHourlyGraphs({
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(25, 40, 25, 50),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DailyGraphsModalHeader(
            title: "Hourly",
          ),
          const SizedBox(
            height: 25,
          ),
          ...HourlyWeatherType.values.asMap().entries.map((entry) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DailyHourlyGraphsCarousel(
                  weatherType: HourlyWeatherType.values[entry.key],
                  hourly: hourly,
                ),
                SizedBox(
                  height:
                      entry.key != HourlyWeatherType.values.length - 1 ? 40 : 0,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
