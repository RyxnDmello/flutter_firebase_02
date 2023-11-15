import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyDaysCardDate extends StatelessWidget {
  const WeeklyDaysCardDate({
    required this.date,
    required this.day,
    super.key,
  });

  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          day,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 18,
          ),
        ),
        Text(
          date,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(180, 255, 255, 255),
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
