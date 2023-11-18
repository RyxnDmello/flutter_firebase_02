import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherTemperature extends StatelessWidget {
  const HomeWeatherTemperature({
    required this.temperature,
    required this.image,
    super.key,
  });

  final String temperature;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$temperature°",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w200,
            color: Colors.white,
            fontSize: 100,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 100,
        ),
      ],
    );
  }
}
