import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormProfileImage extends StatelessWidget {
  const RegisterFormProfileImage({
    required this.onOpenCamera,
    required this.onOpenAvatarModal,
    required this.profileAvatar,
    required this.profileImage,
    super.key,
  });

  final Function() onOpenCamera;
  final Function() onOpenAvatarModal;
  final String? profileAvatar;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (profileImage == null && profileAvatar == null)
          Image.asset(
            "./lib/images/register/profile.png",
            fit: BoxFit.cover,
            width: 60,
          ),
        if (profileImage != null)
          CircleAvatar(
            foregroundImage: FileImage(
              File(
                profileImage!.path,
              ),
            ),
            maxRadius: 45,
          ),
        if (profileAvatar != null)
          Image.asset(
            profileAvatar!,
            width: 85,
            fit: BoxFit.cover,
          ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImageButton(
              onPressed: onOpenCamera,
              icon: Icons.camera,
              label: "Camera",
            ),
            const SizedBox(
              width: 10,
            ),
            ProfileImageButton(
              onPressed: onOpenAvatarModal,
              icon: Icons.face,
              label: "Avatar",
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileImageButton extends StatelessWidget {
  const ProfileImageButton({
    required this.onPressed,
    required this.label,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String label;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 2.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        foregroundColor: Colors.black,
      ),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 20,
        ),
      ),
    );
  }
}
