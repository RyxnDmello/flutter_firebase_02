import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyTomorrowTemperature extends StatelessWidget {
  const WeeklyTomorrowTemperature({
    required this.temperature,
    required this.condition,
    super.key,
  });

  final String temperature;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Tomorrow",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 6.5,
        ),
        Text(
          condition,
          style: GoogleFonts.montserrat(
            color: const Color.fromARGB(180, 255, 255, 255),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.65,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "$temperature°C",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
