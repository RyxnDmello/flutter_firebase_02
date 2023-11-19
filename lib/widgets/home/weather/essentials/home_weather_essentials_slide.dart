import 'package:flutter/material.dart';

import '../../../../models/weather/daily/weather_daily_essentials_model.dart';

import './home_weather_essentials_slide_block.dart';

class HomeWeatherEssentialsSlide extends StatelessWidget {
  const HomeWeatherEssentialsSlide({
    required this.blocks,
    super.key,
  });

  final List<EssentialsModel> blocks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 36.5,
        vertical: 22.5,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color.fromARGB(255, 0, 0, 40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...blocks.map(
            (block) => HomeWeatherEssentialsSlideBlock(
              image: block.image,
              title: block.title,
              value: block.value,
            ),
          ),
        ],
      ),
    );
  }
}
