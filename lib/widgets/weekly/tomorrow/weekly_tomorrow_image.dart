import 'package:flutter/material.dart';

class WeeklyTomorrowImage extends StatelessWidget {
  const WeeklyTomorrowImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "./lib/images/weather/clear-day.png",
      width: 165,
    );
  }
}
