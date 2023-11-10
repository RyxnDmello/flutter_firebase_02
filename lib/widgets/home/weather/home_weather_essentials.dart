import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherEssentials extends StatelessWidget {
  const HomeWeatherEssentials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromARGB(20, 255, 255, 255),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          EssentialBlock(
            image: "./lib/images/home/weather/temperature.png",
            title: "Winds",
            value: "10m/s",
          ),
          EssentialBlock(
            image: "./lib/images/home/weather/temperature.png",
            title: "Winds",
            value: "10m/s",
          ),
          EssentialBlock(
            image: "./lib/images/home/weather/temperature.png",
            title: "Winds",
            value: "10m/s",
          ),
        ],
      ),
    );
  }
}

class EssentialBlock extends StatelessWidget {
  const EssentialBlock({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 50,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 2.5,
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
