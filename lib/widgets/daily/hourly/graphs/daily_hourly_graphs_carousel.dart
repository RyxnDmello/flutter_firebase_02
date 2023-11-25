import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

import '../../graphs/daily_graphs_bar.dart';
import '../../graphs/daily_graphs_line.dart';
import '../../graphs/daily_graphs_pie.dart';

class DailyHourlyGraphsCarousel extends StatefulWidget {
  const DailyHourlyGraphsCarousel({
    required this.weatherType,
    required this.hourly,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;

  @override
  State<DailyHourlyGraphsCarousel> createState() =>
      _DailyHourlyGraphsCarouselState();
}

class _DailyHourlyGraphsCarouselState extends State<DailyHourlyGraphsCarousel>
    with TickerProviderStateMixin {
  int _slideIndex = 0;

  void _switchSlides(int slide) {
    setState(() => _slideIndex = slide);
  }

  String _getTitle() {
    return "${widget.weatherType.name[0].toUpperCase()}${widget.weatherType.name.substring(1)} Graphs";
  }

  String _getImage() {
    switch (widget.weatherType) {
      case HourlyWeatherType.temperature:
        return "./lib/images/weather/essentials/temperature.png";
      case HourlyWeatherType.precipitation:
        return "./lib/images/weather/essentials/rain.png";
      case HourlyWeatherType.humidity:
        return "./lib/images/weather/essentials/humidity.png";
      case HourlyWeatherType.wind:
        return "./lib/images/weather/essentials/wind.png";
      case HourlyWeatherType.pressure:
        return "./lib/images/weather/essentials/pressure.png";
      case HourlyWeatherType.cover:
        return "./lib/images/weather/essentials/cloud.png";
      case HourlyWeatherType.dew:
        return "./lib/images/weather/essentials/dew.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              _getImage(),
              width: 35,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              _getTitle(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: _slideIndex == 2 ? 25 : 15,
        ),
        SizedBox(
          height: _slideIndex == 2 ? 280 : 250,
          width: double.infinity,
          child: PageView(
            onPageChanged: (value) => _switchSlides(value),
            children: [
              DailyGraphsBar(
                barColor: const Color.fromARGB(255, 255, 0, 50),
                weatherType: widget.weatherType,
                hourly: widget.hourly,
                graphTitle: null,
              ),
              DailyGraphsLine(
                barColor: const Color.fromARGB(255, 0, 0, 225),
                weatherType: widget.weatherType,
                hourly: widget.hourly,
                graphTitle: null,
              ),
              DailyGraphsPie(
                sectionsColor: const Color.fromARGB(255, 0, 255, 125),
                weatherType: widget.weatherType,
                hourly: widget.hourly,
                graphTitle: null,
              ),
            ],
          ),
        ),
        SizedBox(
          height: _slideIndex == 2 ? 25 : 0,
        ),
        TabPageSelector(
          selectedColor: Colors.white,
          controller: TabController(
            initialIndex: _slideIndex,
            length: 3,
            vsync: this,
          ),
        ),
      ],
    );
  }
}
