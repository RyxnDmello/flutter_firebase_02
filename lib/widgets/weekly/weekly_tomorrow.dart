import 'package:flutter/material.dart';

import './tomorrow/weekly_tomorrow_image.dart';
import './tomorrow/weekly_tomorrow_temperature.dart';

class WeeklyTomorrow extends StatelessWidget {
  const WeeklyTomorrow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeeklyTomorrowImage(),
        SizedBox(
          width: 40,
        ),
        WeeklyTomorrowTemperature()
      ],
    );
  }
}
