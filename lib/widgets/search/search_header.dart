import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 125,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EXPLORE",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 30,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "THE CLOUDS",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 0,
                fontSize: 30,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              DateFormat("d MMM, EEEE").format(DateTime.now()),
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.65,
                fontSize: 20,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
