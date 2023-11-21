import 'package:flutter/material.dart';

import '../../models/weather/daily/weather_daily_hourly_model.dart';

import './hourly/daily_hourly_block.dart';
import './hourly/daily_hourly_button.dart';
import './hourly/daily_hourly_indicators.dart';

class DailyHourly extends StatefulWidget {
  const DailyHourly({
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;

  @override
  State<DailyHourly> createState() => _DailyHourlyState();
}

class _DailyHourlyState extends State<DailyHourly>
    with TickerProviderStateMixin {
  int _currentSlide = 0;

  void _switchSlides(int slide) {
    if (slide == 0 && (slide + 1) % 4 != 0) return;
    setState(() => _currentSlide = (slide + 1) ~/ 4);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 100),
              width: 2,
            ),
            color: const Color.fromARGB(255, 0, 0, 40),
          ),
          child: PageView.builder(
            onPageChanged: (value) => _switchSlides(value),
            controller: PageController(
              viewportFraction: 1 / 4,
            ),
            padEnds: false,
            pageSnapping: false,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.hourly.length,
            itemBuilder: (context, index) {
              return DailyHourlyBlock(
                hour: widget.hourly[index].hour,
                image: widget.hourly[index].image,
                value: widget.hourly[index].temperature,
              );
            },
          ),
        ),
        const SizedBox(
          height: 2.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DailyHourlyButton(
              onPressed: () {},
            ),
            DailyHourlyIndicators(
              currentSlide: _currentSlide,
              vsync: this,
            ),
          ],
        ),
      ],
    );
  }
}
