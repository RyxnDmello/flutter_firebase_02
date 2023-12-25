import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelledDivider extends StatelessWidget {
  const LabelledDivider({
    required this.label,
    this.gap = 15,
    super.key,
  });

  final String label;
  final double gap;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Color.fromARGB(25, 255, 255, 255),
            thickness: 2,
            height: 0,
          ),
        ),
        SizedBox(
          width: gap,
        ),
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: const Color.fromARGB(100, 255, 255, 255),
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            fontSize: 12.5,
          ),
        ),
        SizedBox(
          width: gap,
        ),
        const Expanded(
          child: Divider(
            color: Color.fromARGB(25, 255, 255, 255),
            thickness: 2,
            height: 0,
          ),
        ),
      ],
    );
  }
}
