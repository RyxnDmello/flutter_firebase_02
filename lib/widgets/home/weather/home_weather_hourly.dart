import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherHourly extends StatelessWidget {
  const HomeWeatherHourly({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        padEnds: false,
        controller: PageController(
          viewportFraction: 0.25,
        ),
        itemBuilder: (context, index) {
          return const HourlyBlock();
        },
      ),
    );
  }
}

class HourlyBlock extends StatelessWidget {
  const HourlyBlock({
    super.key,
  });

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
            "10Am",
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
            "./lib/images/home/weather/rain.png",
            width: 40,
          ),
          const SizedBox(
            height: 8.5,
          ),
          Text(
            "26°",
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
