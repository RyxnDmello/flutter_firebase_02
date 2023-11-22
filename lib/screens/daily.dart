import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather/daily/weather_daily_hourly_model.dart';
import '../models/weather/weather_daily_model.dart';

import '../widgets/daily/daily_location.dart';
import '../widgets/daily/daily_temperature.dart';
import '../widgets/daily/daily_essentials.dart';
import '../widgets/daily/daily_hourly.dart';
import '../widgets/daily/daily_graphs.dart';

import '../widgets/daily/daily_essentials_graphs.dart';

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
  HourlyWeatherType _essentialsGraphType = HourlyWeatherType.precipitation;

  void _selectEssentialsGraph(HourlyWeatherType type) {
    setState(() => _essentialsGraphType = type);

    _openEssentialsGraph(
      title:
          "${type.toString()[0].toUpperCase()}${type.toString().substring(1)}",
      weatherType: type,
    );
  }

  void _openEssentialsGraph({
    required HourlyWeatherType weatherType,
    required String title,
  }) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 0, 0, 40),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      context: context,
      builder: (context) {
        return DailyEssentialsGraphs(
          hourly: widget.day.hourly,
          weatherType: weatherType,
          title: title,
        );
      },
    );
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
              onSelect: _selectEssentialsGraph,
              selected: _essentialsGraphType,
            ),
            const SizedBox(
              height: 20,
            ),
            DailyHourly(
              hourly: widget.day.hourly,
            ),
            const SizedBox(
              height: 40,
            ),
            DailyGraphs(
              hourly: widget.day.hourly,
            ),
          ],
        ),
      ),
    );
  }
}
