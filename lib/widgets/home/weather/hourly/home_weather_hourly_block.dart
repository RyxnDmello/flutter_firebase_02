import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherHourlyBlock extends StatelessWidget {
  const HomeWeatherHourlyBlock({
    required this.image,
    required this.hour,
    required this.value,
    super.key,
  });

  final String image;
  final String hour;
  final String value;

  @override
  Widget build(BuildContext context) {
    String getFormattedHour() {
      if (int.parse(hour) == 0) {
        return "12Am";
      }

      if (int.parse(hour) < 12) {
        return "${int.parse(hour)}Am";
      }

      if (int.parse(hour) > 12) {
        return "${int.parse(hour) - 12}Pm";
      }

      return "12Pm";
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 0, 0, 100),
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: const Color.fromARGB(255, 0, 0, 40),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getFormattedHour(),
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(180, 255, 255, 255),
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            image,
            width: 40,
          ),
          const SizedBox(
            height: 8.5,
          ),
          Text(
            "$value°C",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
