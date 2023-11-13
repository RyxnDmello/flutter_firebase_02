import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/weather_essentials_model.dart';

class HomeWeatherEssentials extends StatelessWidget {
  const HomeWeatherEssentials({
    required this.essentials,
    super.key,
  });

  final List<WeatherEssentials> essentials;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: essentials.length,
        itemBuilder: (context, index) {
          return EssentialSlide(
            blocks: essentials[index].blocks,
          );
        },
      ),
    );
  }
}

class EssentialSlide extends StatelessWidget {
  const EssentialSlide({
    required this.blocks,
    super.key,
  });

  final List<EssentialsBlock> blocks;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6.5,
        vertical: 0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 36.5,
        vertical: 22.5,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        color: Color.fromARGB(255, 0, 0, 40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...blocks.map(
            (block) => SlideBlock(
              image: block.image,
              title: block.title,
              value: block.value,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideBlock extends StatelessWidget {
  const SlideBlock({
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
          width: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
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
