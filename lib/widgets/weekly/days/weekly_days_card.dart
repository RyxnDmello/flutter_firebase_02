import 'package:flutter/material.dart';

import './card/weekly_days_card_date.dart';
import './card/weekly_days_card_image.dart';
import './card/weekly_days_card_temperature.dart';

class WeeklyDaysCard extends StatelessWidget {
  const WeeklyDaysCard({
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
            WeeklyDaysCardDate(
              date: date,
              day: day,
            ),
            WeeklyDaysCardTemperature(
              temperature: temperature,
            ),
            WeeklyDaysCardImage(
              image: image,
            ),
          ],
        ),
      ),
    );
  }
}
