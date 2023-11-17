import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/widgets/weekly/weekly_tomorrow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather_model.dart';

import '../widgets/weekly/weekly_days.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({
    required this.weather,
    super.key,
  });

  final Weather weather;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const WeeklyTomorrow(),
            const SizedBox(
              height: 50,
            ),
            WeeklyDays(
              weekly: weather.weekly,
            ),
          ],
        ),
      ),
    );
  }
}
