import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 100,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 18,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EXPLORE",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 35,
              ),
            ),
            Text(
              "THE WORLD",
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 1,
                fontSize: 35,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
