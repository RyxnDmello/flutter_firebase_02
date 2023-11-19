import 'package:flutter/material.dart';

import '../../models/weather/weather_weekly_model.dart';

import './tomorrow/weekly_tomorrow_image.dart';
import './tomorrow/weekly_tomorrow_temperature.dart';

class WeeklyTomorrow extends StatelessWidget {
  const WeeklyTomorrow({
    required this.day,
    super.key,
  });

  final WeatherWeeklyModel day;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeeklyTomorrowImage(
          image: day.image,
        ),
        const SizedBox(
          width: 40,
        ),
        WeeklyTomorrowTemperature(
          temperature: day.temperature,
          condition: day.condition,
        )
      ],
    );
  }
}
