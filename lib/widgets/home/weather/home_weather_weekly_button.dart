import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherWeeklyButton extends StatelessWidget {
  const HomeWeatherWeeklyButton({
    required this.onOpenScreen,
    super.key,
  });

  final void Function() onOpenScreen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onOpenScreen,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 200),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 8,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
      ),
      child: Text(
        "Weekly Forecast",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 18,
        ),
      ),
    );
  }
}
