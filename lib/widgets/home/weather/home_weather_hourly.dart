import 'package:flutter/material.dart';

import '../../../models/weather/daily/weather_daily_hourly_model.dart';

import './hourly/home_weather_hourly_block.dart';

class HomeWeatherHourly extends StatefulWidget {
  const HomeWeatherHourly({
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;

  @override
  State<HomeWeatherHourly> createState() => _HomeWeatherHourlyState();
}

class _HomeWeatherHourlyState extends State<HomeWeatherHourly>
    with TickerProviderStateMixin {
  int _currentSlide = 0;

  void _switchSlides(int slide) {
    if (slide != 0 && (slide + 1) % 4 != 0) return;
    setState(() => _currentSlide = (slide + 1) ~/ 4);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: PageView.builder(
            onPageChanged: (value) => _switchSlides(value),
            controller: PageController(
              viewportFraction: 0.25,
            ),
            padEnds: false,
            pageSnapping: false,
            itemCount: widget.hourly.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return HomeWeatherHourlyBlock(
                hour: widget.hourly[index].hour,
                image: widget.hourly[index].image,
                value: widget.hourly[index].temperature,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TabPageSelector(
          selectedColor: Colors.white,
          controller: TabController(
            initialIndex: _currentSlide,
            vsync: this,
            length: 6,
          ),
        ),
      ],
    );
  }
}
