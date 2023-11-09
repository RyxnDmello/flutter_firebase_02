import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeDrawerTile extends StatelessWidget {
  const HomeDrawerTile({
    required this.icon,
    required this.label,
    super.key,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (icon.fontPackage != null)
              FaIcon(
                icon,
                color: Colors.black,
              ),
            if (icon.fontPackage == null)
              Icon(
                icon,
                color: Colors.black,
              ),
            const SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0.65,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
