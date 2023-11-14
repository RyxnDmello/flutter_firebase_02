import 'package:flutter/material.dart';

import './day/weekly_day_date.dart';

class WeeklyDay extends StatelessWidget {
  const WeeklyDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          WeeklyDayDate(
            date: "14 Nov",
            day: "Tuesday",
          ),
        ],
      ),
    );
  }
}
