import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyTomorrowTemperature extends StatelessWidget {
  const WeeklyTomorrowTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tomorrow",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
          ),
        ),
        Text(
          "Heavy Rainfall",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
        Text(
          "28°",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 50,
          ),
        ),
      ],
    );
  }
}
