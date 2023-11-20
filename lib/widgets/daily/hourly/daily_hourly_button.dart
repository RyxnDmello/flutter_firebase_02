import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyHourlyButton extends StatelessWidget {
  const DailyHourlyButton({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        foregroundColor: Colors.white,
      ),
      icon: const Icon(
        Icons.bar_chart,
        color: Colors.white,
        size: 28,
      ),
      label: Text(
        "Hourly Graphs",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 18,
        ),
      ),
    );
  }
}
