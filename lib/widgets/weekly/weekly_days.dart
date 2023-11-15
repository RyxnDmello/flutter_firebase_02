import 'package:flutter/material.dart';

import '../../models/weather/weather_weekly_model.dart';

import './days/weekly_days_card.dart';

class WeeklyDays extends StatelessWidget {
  const WeeklyDays({
    required this.weekly,
    super.key,
  });

  final List<WeatherWeekly> weekly;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 20,
      ),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: weekly.length,
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
    );
  }
}
