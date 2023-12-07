import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyGraphsModalHeader extends StatelessWidget {
  const DailyGraphsModalHeader({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${title[0].toUpperCase()}${title.substring(1)} Graphs",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 20,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close_sharp,
          ),
          color: Colors.white,
          splashRadius: 30,
          iconSize: 30,
        )
      ],
    );
  }
}
