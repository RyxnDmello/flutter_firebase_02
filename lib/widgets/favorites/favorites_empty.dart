import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesEmpty extends StatelessWidget {
  const FavoritesEmpty({
    required this.onSearch,
    required this.message,
    required this.label,
    required this.image,
    super.key,
  });

  final void Function() onSearch;
  final String message;
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 180,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          message,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 20,
            height: 1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: onSearch,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(
                  bottom: 8.5,
                  top: 8.5,
                ),
                backgroundColor: const Color.fromARGB(255, 0, 0, 150),
                foregroundColor: const Color.fromARGB(255, 0, 0, 255),
              ),
              icon: const Icon(
                Icons.place_outlined,
                color: Colors.white,
                size: 25,
              ),
              label: Text(
                label,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.65,
                  fontSize: 20,
                  height: 1,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
