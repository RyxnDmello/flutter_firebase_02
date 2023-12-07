import 'package:flutter/material.dart';

import '../models/weather_model.dart';

import '../widgets/weekly/weekly_tomorrow.dart';
import '../widgets/weekly/weekly_days.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({
    required this.weather,
    super.key,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 20),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          iconSize: 30,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeeklyTomorrow(
              day: weather.weekly[1],
            ),
            const SizedBox(
              height: 50,
            ),
            WeeklyDays(
              weekly: weather.weekly,
              daily: weather.daily,
            ),
          ],
        ),
      ),
    );
  }
}
