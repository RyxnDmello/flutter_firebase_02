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
          fit: BoxFit.cover,
          width: 100,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EXPLORE YOUR",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 28,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "SAVED PLACES",
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(200, 255, 255, 255),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
                fontSize: 25,
                height: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}
