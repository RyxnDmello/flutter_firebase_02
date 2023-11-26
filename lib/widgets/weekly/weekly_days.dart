import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/screens/daily.dart';

import '../../models/weather/weather_weekly_model.dart';
import '../../models/weather/weather_daily_model.dart';

import './days/weekly_days_title.dart';
import './days/weekly_days_card.dart';

class WeeklyDays extends StatelessWidget {
  const WeeklyDays({
    required this.weekly,
    required this.daily,
    super.key,
  });

  final List<WeatherWeeklyModel> weekly;
  final List<WeatherDailyModel> daily;

  @override
  Widget build(BuildContext context) {
    void openDailyScreen(int index) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return DailyScreen(
              day: daily[index],
            );
          },
        ),
      );
    }

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
              onTapDay: () => openDailyScreen(index),
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
