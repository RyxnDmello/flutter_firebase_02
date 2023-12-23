import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountReset extends StatelessWidget {
  const AccountReset({
    required this.onReset,
    required this.label,
    required this.icon,
    super.key,
  });

  final void Function() onReset;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onReset,
      icon: Icon(
        icon,
        color: Colors.white,
        size: 26,
      ),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 18,
        ),
      ),
    );
  }
}
