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
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 40),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
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
            hour,
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
            value,
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
