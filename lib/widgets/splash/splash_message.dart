import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashMessage extends StatelessWidget {
  const SplashMessage({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 40,
          ),
        ),
        const SizedBox(
          height: 12.5,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(
              width: 2.5,
            ),
            Text(
              description,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
