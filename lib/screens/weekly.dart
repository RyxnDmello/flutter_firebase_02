import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          icon: const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.white,
          ),
          splashRadius: 25,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeeklyTomorrow(
              day: weather.weekly[0],
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
