import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormSwitcher extends StatelessWidget {
  const RegisterFormSwitcher({
    required this.onSwitchFrom,
    required this.label,
    required this.icon,
    super.key,
  });

  final void Function() onSwitchFrom;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: onSwitchFrom,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 2.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            foregroundColor: Colors.black,
          ),
          label: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.65,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
