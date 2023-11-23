import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyEssentialsGraphsTitle extends StatelessWidget {
  const DailyEssentialsGraphsTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${title[0].toUpperCase()}${title.substring(1)} Graphs",
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0.65,
        fontSize: 20,
      ),
    );
  }
}
