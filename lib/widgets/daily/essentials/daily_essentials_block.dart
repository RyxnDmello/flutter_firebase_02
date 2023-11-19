import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyEssentialsBlock extends StatelessWidget {
  const DailyEssentialsBlock({
    required this.onTap,
    required this.title,
    required this.image,
    required this.value,
    super.key,
  });

  final void Function(String type) onTap;
  final String title;
  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Container(
        width: 115,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 100),
            width: 2,
          ),
          color: const Color.fromARGB(255, 0, 0, 40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 18,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
