import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeeklyDaysTitle extends StatelessWidget {
  const WeeklyDaysTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FaIcon(
          FontAwesomeIcons.clock,
          color: Colors.white,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Weekly Forecast",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
