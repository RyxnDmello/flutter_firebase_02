import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/weather_model.dart';

import '../widgets/weekly/weekly_day.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: weather.weekly.length,
              itemBuilder: (context, index) {
                return WeeklyDay(
                  onTapDay: () {},
                  temperature: weather.weekly[index].temperature,
                  image: weather.weekly[index].image,
                  date: weather.weekly[index].date,
                  day: weather.weekly[index].day,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
