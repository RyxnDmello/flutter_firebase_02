import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesListCityDetails extends StatelessWidget {
  const FavoritesListCityDetails({
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    super.key,
  });

  final String location;
  final String latitude;
  final String longitude;
  final String timezone;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              location,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 20,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 12.5,
            ),
            Text(
              timezone,
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(200, 255, 255, 255),
                fontWeight: FontWeight.w500,
                letterSpacing: 0.65,
                fontSize: 18,
                height: 1,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              latitude,
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(200, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.65,
                fontSize: 16,
                height: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              longitude,
              style: GoogleFonts.montserrat(
                color: const Color.fromARGB(200, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.65,
                fontSize: 16,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
