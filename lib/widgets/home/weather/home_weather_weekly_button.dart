import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherWeeklyButton extends StatelessWidget {
  const HomeWeatherWeeklyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 255),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 8,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
      ),
      child: Text(
        "Weekly Forecast",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 18,
        ),
      ),
    );
  }
}
