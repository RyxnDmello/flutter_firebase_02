import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather/weather_daily_model.dart';

import '../widgets/daily/daily_location.dart';
import '../widgets/daily/daily_temperature.dart';
import '../widgets/daily/daily_essentials.dart';
import '../widgets/daily/daily_hourly.dart';

class DailyScreen extends StatefulWidget {
  const DailyScreen({
    required this.day,
    super.key,
  });

  final WeatherDailyModel day;

  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  String _graphType = "Rain";

  void _selectGraphType(String type) {
    setState(() => _graphType = type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 20),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
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
            DailyLocation(
              location: widget.day.location.location,
              date: widget.day.location.date,
            ),
            const SizedBox(
              height: 30,
            ),
            DailyTemperature(
              temperature: widget.day.temperature.temperature,
              condition: widget.day.temperature.condition,
              image: widget.day.temperature.image,
            ),
            const SizedBox(
              height: 30,
            ),
            DailyEssentials(
              essentials: widget.day.essentials,
              onTap: _selectGraphType,
            ),
            const SizedBox(
              height: 20,
            ),
            DailyHourly(
              hourly: widget.day.hourly,
            ),
          ],
        ),
      ),
    );
  }
}
