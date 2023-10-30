import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterTitle extends StatelessWidget {
  const RegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "CREATE AN ACCOUNT",
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 40,
          ),
        ),
        Text(
          "Sync With The Clouds",
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
