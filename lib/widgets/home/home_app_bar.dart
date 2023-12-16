import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './appBar/home_app_bar_profile.dart';
import './appBar/home_app_bar_button.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.onTapProfile,
    required this.onTapRefresh,
    required this.onTapSearch,
    required this.onTapMap,
    required this.profile,
    super.key,
  });

  final Future<void> Function() onTapMap;
  final void Function() onTapSearch;
  final void Function() onTapProfile;
  final void Function() onTapRefresh;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HomeAppBarProfile(
            onTapProfile: onTapProfile,
            profile: profile,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeAppBarButton(
                icon: FontAwesomeIcons.map,
                onPressed: () async => await onTapMap(),
              ),
              HomeAppBarButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                onPressed: onTapSearch,
              ),
              HomeAppBarButton(
                icon: FontAwesomeIcons.arrowRotateLeft,
                onPressed: onTapRefresh,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
