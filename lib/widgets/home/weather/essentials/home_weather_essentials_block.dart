import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherEssentialsBlock extends StatelessWidget {
  const HomeWeatherEssentialsBlock({
    required this.image,
    required this.title,
    required this.value,
    super.key,
  });

  final String image;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    String getPostFix() {
      if (title == "Pressure") {
        return "mb";
      }

      if (title == "Wind") {
        return "kph";
      }

      if (title == "Dew") {
        return "°C";
      }

      return "%";
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "$value${getPostFix()}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 18,
          ),
        ),
        Text(
          title,
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
