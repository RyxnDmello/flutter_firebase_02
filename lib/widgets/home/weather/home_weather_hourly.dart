import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/weather_hourly_model.dart';

class HomeWeatherHourly extends StatelessWidget {
  const HomeWeatherHourly({
    required this.onSlideChanged,
    required this.currentSlide,
    required this.tabVsync,
    required this.hourly,
    super.key,
  });

  final void Function(int currentSlide) onSlideChanged;
  final List<WeatherHourly> hourly;
  final TickerProvider tabVsync;
  final int currentSlide;

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
            onPageChanged: (value) {
              if (value == 0) {
                onSlideChanged(0);
                return;
              }

              if ((value + 1) % 4 != 0) return;

              onSlideChanged(((value + 1) ~/ 4));
            },
            controller: PageController(
              viewportFraction: 0.25,
            ),
            padEnds: false,
            pageSnapping: false,
            itemCount: hourly.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return HourlyBlock(
                image: hourly[index].image,
                hour: hourly[index].hour,
                value: hourly[index].value,
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TabPageSelector(
          controller: TabController(
            initialIndex: currentSlide,
            vsync: tabVsync,
            length: 6,
          ),
        ),
      ],
    );
  }
}

class HourlyBlock extends StatelessWidget {
  const HourlyBlock({
    required this.image,
    required this.hour,
    required this.value,
    super.key,
  });

  final String image;
  final String hour;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 40),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hour,
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(180, 255, 255, 255),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            width: 40,
          ),
          const SizedBox(
            height: 8.5,
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
