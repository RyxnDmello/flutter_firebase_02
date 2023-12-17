import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({
    required this.onTapSearch,
    required this.message,
    required this.image,
    super.key,
  });

  final void Function() onTapSearch;
  final String message;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 125,
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          message,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton.icon(
          onPressed: onTapSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 150),
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
              vertical: 12,
            ),
          ),
          icon: const FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.white,
            size: 16,
          ),
          label: Text(
            "Explore Places",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.65,
              fontSize: 18,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
