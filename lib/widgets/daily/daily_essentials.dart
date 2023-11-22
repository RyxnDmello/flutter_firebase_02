import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_essentials_model.dart';
import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './essentials/daily_essentials_slide.dart';

class DailyEssentials extends StatelessWidget {
  const DailyEssentials({
    required this.essentials,
    required this.onSelect,
    required this.selected,
    super.key,
  });

  final List<WeatherDailyEssentialsModel> essentials;
  final void Function(HourlyWeatherType type) onSelect;
  final HourlyWeatherType selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: essentials.length,
        itemBuilder: (context, index) {
          return DailyEssentialsSlide(
            blocks: essentials[index].blocks,
            onSelect: onSelect,
            selected: selected,
          );
        },
      ),
    );
  }
}
