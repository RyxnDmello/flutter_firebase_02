import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterLogo extends StatelessWidget {
  const RegisterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 80, 0, 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "./lib/images/register/logo.png",
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
