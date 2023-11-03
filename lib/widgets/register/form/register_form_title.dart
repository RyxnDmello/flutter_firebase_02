import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormTitle extends StatelessWidget {
  const RegisterFormTitle({
    required this.title,
    required this.description,
    super.key,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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
        Text(
          description,
          style: GoogleFonts.abel(
            color: Colors.white,
            fontWeight: FontWeight.w100,
            letterSpacing: 1,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
