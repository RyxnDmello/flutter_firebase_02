import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyLocation extends StatelessWidget {
  const DailyLocation({
    required this.location,
    required this.date,
    super.key,
  });

  final String location;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          location,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 30,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          date,
          style: GoogleFonts.montserrat(
            color: const Color.fromARGB(165, 255, 255, 255),
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            fontSize: 20,
            height: 1,
          ),
        ),
      ],
    );
  }
}
