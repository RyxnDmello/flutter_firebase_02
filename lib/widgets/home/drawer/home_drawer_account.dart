import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDrawerAccount extends StatelessWidget {
  const HomeDrawerAccount({
    required this.profileAvatar,
    required this.profileImage,
    required this.username,
    super.key,
  });

  final String? profileAvatar;
  final File? profileImage;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "./lib/images/home/drawer/account-background.png",
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (profileAvatar != null)
              Image.asset(
                profileAvatar!,
                fit: BoxFit.cover,
                width: 85,
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              username,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
