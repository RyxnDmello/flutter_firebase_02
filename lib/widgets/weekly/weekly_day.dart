import 'package:flutter/material.dart';

import './day/weekly_day_date.dart';
import './day/weekly_day_image.dart';
import './day/weekly_day_temperature.dart';

class WeeklyDay extends StatelessWidget {
  const WeeklyDay({
    required this.temperature,
    required this.onTapDay,
    required this.image,
    required this.date,
    required this.day,
    super.key,
  });

  final void Function() onTapDay;
  final String temperature;
  final String image;
  final String date;
  final String day;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapDay,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 40),
          borderRadius: BorderRadius.all(
            Radius.circular(6.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WeeklyDayDate(
              date: date,
              day: day,
            ),
            WeeklyDayTemperature(
              temperature: temperature,
            ),
            WeeklyDayImage(
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
