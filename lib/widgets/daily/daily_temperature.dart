import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyTemperature extends StatelessWidget {
  const DailyTemperature({
    required this.temperature,
    required this.condition,
    required this.image,
    super.key,
  });

  final String temperature;
  final String condition;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$temperature°C",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w200,
                color: Colors.white,
                fontSize: 85,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 120,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 6.5,
            ),
            Text(
              condition,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
