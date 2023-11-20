import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyHourlyBlock extends StatelessWidget {
  const DailyHourlyBlock({
    required this.hour,
    required this.image,
    required this.value,
    super.key,
  });

  final String hour;
  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          hour,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(180, 255, 255, 255),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 40,
        ),
        const SizedBox(
          height: 8.5,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(180, 255, 255, 255),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
