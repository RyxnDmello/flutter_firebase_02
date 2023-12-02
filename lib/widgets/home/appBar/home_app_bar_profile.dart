import 'package:flutter/material.dart';

class HomeAppBarProfile extends StatelessWidget {
  const HomeAppBarProfile({
    required this.onTapProfile,
    required this.profile,
    super.key,
  });

  final void Function() onTapProfile;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapProfile,
      child: profile.contains("./lib/images/register/avatars/")
          ? Image.asset(
              profile,
              fit: BoxFit.cover,
              width: 45,
            )
          : CircleAvatar(
              foregroundImage: NetworkImage(
                profile,
              ),
              backgroundColor: Colors.black,
              radius: 22.5,
            ),
    );
  }
}
