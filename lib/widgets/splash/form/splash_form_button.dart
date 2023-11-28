import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashFormButton extends StatelessWidget {
  const SplashFormButton({
    required this.onSubmit,
    super.key,
  });

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 8,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        elevation: 0,
      ),
      onPressed: onSubmit,
      child: Text(
        "Save Location",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),
    );
  }
}
