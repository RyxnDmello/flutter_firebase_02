import 'package:flutter/material.dart';

class HomeAppBarProfile extends StatelessWidget {
  const HomeAppBarProfile({
    required this.onTapProfile,
    super.key,
  });

  final void Function() onTapProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapProfile,
      child: Image.asset(
        "./lib/images/register/avatars/avatar-1.png",
        fit: BoxFit.cover,
        width: 45,
      ),
    );
  }
}
