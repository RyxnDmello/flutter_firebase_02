import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormProfileImage extends StatelessWidget {
  const RegisterFormProfileImage({
    required this.onOpenCamera,
    required this.profileImage,
    super.key,
  });

  final Function() onOpenCamera;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (profileImage == null)
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
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileImageButton(
              onOpenCamera: onOpenCamera,
              icon: Icons.camera,
              label: "Camera",
            ),
            const SizedBox(
              width: 10,
            ),
            ProfileImageButton(
              onOpenCamera: onOpenCamera,
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
    required this.onOpenCamera,
    required this.label,
    required this.icon,
    super.key,
  });

  final IconData icon;
  final String label;

  final Function() onOpenCamera;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onOpenCamera,
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
