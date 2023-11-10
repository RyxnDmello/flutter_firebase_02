import 'package:flutter/material.dart';

import './appBar/home_app_bar_profile.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.onTapProfile,
    super.key,
  });

  final void Function() onTapProfile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeAppBarProfile(
            onTapProfile: onTapProfile,
          ),
        ],
      ),
    );
  }
}
