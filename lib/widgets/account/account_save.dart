import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSave extends StatelessWidget {
  const AccountSave({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(2550, 0, 0, 180),
            padding: const EdgeInsets.only(
              bottom: 8,
              top: 8,
            ),
          ),
          child: Text(
            label,
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
