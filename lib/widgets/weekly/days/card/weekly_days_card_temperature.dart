import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyDaysCardTemperature extends StatelessWidget {
  const WeeklyDaysCardTemperature({
    required this.temperature,
    super.key,
  });

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${double.parse(temperature).round()}°C",
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 40,
      ),
    );
  }
}
