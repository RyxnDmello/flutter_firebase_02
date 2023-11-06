import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar registerFormWarning({
  required String message,
  required IconData icon,
}) {
  return SnackBar(
    backgroundColor: Colors.black.withOpacity(0.65),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 10,
    ),
    closeIconColor: Colors.white,
    showCloseIcon: true,
    elevation: 2,
    content: Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          message,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
      ],
    ),
  );
}
