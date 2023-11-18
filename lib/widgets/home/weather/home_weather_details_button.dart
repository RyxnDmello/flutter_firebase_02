import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWeatherDetailsButton extends StatelessWidget {
  const HomeWeatherDetailsButton({
    required this.onOpenScreen,
    super.key,
  });

  final void Function() onOpenScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: onOpenScreen,
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 0, 0, 200),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2.5,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            elevation: 0,
          ),
          icon: const Icon(
            color: Colors.white,
            Icons.cloud_outlined,
            size: 25,
          ),
          label: Text(
            "Expand Details",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
