import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./lib/images/logo.png",
            fit: BoxFit.cover,
            width: 65,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "SkySync",
            style: GoogleFonts.urbanist(
              fontWeight: FontWeight.w200,
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
