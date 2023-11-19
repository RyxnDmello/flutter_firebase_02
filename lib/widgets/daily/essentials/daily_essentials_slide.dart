import 'package:flutter/material.dart';

import '../../../models/weather/daily/weather_daily_essentials_model.dart';

import './daily_essentials_block.dart';

class DailyEssentialsSlide extends StatelessWidget {
  const DailyEssentialsSlide({
    required this.blocks,
    required this.onTap,
    super.key,
  });

  final List<EssentialBlockModel> blocks;
  final void Function(String type) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...blocks.map(
            (block) => DailyEssentialsBlock(
              onTap: onTap,
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
