import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/register/avatars.dart';

class AvatarsModal extends StatelessWidget {
  const AvatarsModal({
    required this.onSelectAvatar,
    super.key,
  });

  final void Function({
    required String selectedAvatar,
  }) onSelectAvatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: AssetImage(
            "./lib/images/register/avatars/avatar-modal.png",
          ),
          fit: BoxFit.cover,
          opacity: 0.65,
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Pick Your Avatar",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              shadows: [
                const Shadow(
                  color: Colors.black,
                  blurRadius: 15,
                ),
              ],
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 22.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: avatars.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 35,
                mainAxisSpacing: 25,
                childAspectRatio: 1,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onSelectAvatar(
                    selectedAvatar: avatars[index],
                  ),
                  child: Image.asset(
                    avatars[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
