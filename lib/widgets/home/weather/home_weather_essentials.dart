import 'package:flutter/material.dart';

import '../../../models/weather/daily/weather_daily_essentials_model.dart';

import './essentials/home_weather_essentials_slide.dart';

class HomeWeatherEssentials extends StatelessWidget {
  const HomeWeatherEssentials({
    required this.essentials,
    super.key,
  });

  final List<WeatherDailyEssentialsModel> essentials;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: essentials.length,
        itemBuilder: (context, index) {
          return HomeWeatherEssentialsSlide(
            blocks: essentials[index].blocks,
          );
        },
      ),
    );
  }
}
