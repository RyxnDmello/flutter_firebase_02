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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _getTitle(),
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 22.5,
          ),
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
                graphMax: widget.weatherType == HourlyWeatherType.pressure
                    ? 1500
                    : 100,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabPageSelector(
              selectedColor: Colors.white,
              controller: TabController(
                initialIndex: _slideIndex,
                length: 3,
                vsync: this,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
