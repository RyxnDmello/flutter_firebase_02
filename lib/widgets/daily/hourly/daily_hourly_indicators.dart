import 'package:flutter/material.dart';

class DailyHourlyIndicators extends StatelessWidget {
  const DailyHourlyIndicators({
    required this.currentSlide,
    required this.vsync,
    super.key,
  });

  final TickerProvider vsync;
  final int currentSlide;

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      selectedColor: Colors.white,
      controller: TabController(
        initialIndex: currentSlide,
        vsync: vsync,
        length: 6,
      ),
    );
  }
}
