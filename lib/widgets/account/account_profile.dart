import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({
    required this.onOpenAvatars,
    required this.onOpenCamera,
    required this.profileAvatar,
    required this.profileImage,
    super.key,
  });

  final void Function() onOpenAvatars;
  final void Function() onOpenCamera;
  final String? profileAvatar;
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    ImageProvider setProfileImage() {
      if (profileImage!.contains("https://")) {
        return NetworkImage(
          profileImage!,
        );
      }

      return FileImage(
        File(
          profileImage!,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (profileImage != null)
          CircleAvatar(
            foregroundImage: setProfileImage(),
            radius: 75,
          ),
        if (profileAvatar != null)
          Image.asset(
            profileAvatar!,
            fit: BoxFit.cover,
            width: 150,
          ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileButton(
              onTap: onOpenCamera,
              icon: Icons.camera,
              label: "Camera",
            ),
            ProfileButton(
              onTap: onOpenAvatars,
              icon: Icons.face,
              label: "Avatars",
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    required this.onTap,
    required this.label,
    required this.icon,
    super.key,
  });

  final void Function() onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: Text(
        label,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 20,
        ),
      ),
    );
  }
}
