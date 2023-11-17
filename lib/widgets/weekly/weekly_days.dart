import 'package:flutter/material.dart';

import '../../models/weather/weather_weekly_model.dart';

import './days/weekly_days_title.dart';
import './days/weekly_days_card.dart';

class WeeklyDays extends StatelessWidget {
  const WeeklyDays({
    required this.weekly,
    super.key,
  });

  final List<WeatherWeekly> weekly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const WeeklyDaysTitle(),
        const SizedBox(
          height: 15,
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: weekly.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return WeeklyDaysCard(
              onTapDay: () {},
              temperature: weekly[index].temperature,
              image: weekly[index].image,
              date: weekly[index].date,
              day: weekly[index].day,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
        ),
      ],
    );
  }
}
