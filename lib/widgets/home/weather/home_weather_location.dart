import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeWeatherLocation extends StatelessWidget {
  const HomeWeatherLocation({
    required this.location,
    super.key,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          location,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 30,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Today, ${DateFormat("d MMM").format(DateTime.now())}",
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(165, 255, 255, 255),
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
            fontSize: 18,
            height: 1,
          ),
        ),
      ],
    );
  }
}
