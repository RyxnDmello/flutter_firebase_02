import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './drawer/home_drawer_account.dart';
import './drawer/home_drawer_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    required this.onTapAccount,
    required this.onTapRefresh,
    required this.onTapSearch,
    required this.onTapMap,
    required this.username,
    required this.profile,
    super.key,
  });

  final void Function() onTapAccount;
  final void Function() onTapRefresh;
  final void Function() onTapSearch;
  final void Function() onTapMap;
  final String username;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeDrawerAccount(
            username: username,
            profile: profile,
          ),
          const SizedBox(
            height: 20,
          ),
          HomeDrawerTile(
            icon: FontAwesomeIcons.circleUser,
            onTap: onTapAccount,
            label: "Account",
          ),
          HomeDrawerTile(
            icon: FontAwesomeIcons.map,
            onTap: onTapMap,
            label: "Favorites",
          ),
          HomeDrawerTile(
            icon: FontAwesomeIcons.magnifyingGlass,
            onTap: () {
              Navigator.of(context).pop();
              onTapSearch();
            },
            label: "Search",
          ),
          HomeDrawerTile(
            icon: FontAwesomeIcons.arrowRotateLeft,
            onTap: onTapRefresh,
            label: "Refresh",
          ),
          const SizedBox(
            height: 15,
          ),
          HomeDrawerTile(
            icon: FontAwesomeIcons.arrowRightFromBracket,
            onTap: () => FirebaseAuth.instance.signOut(),
            label: "Logout",
          ),
        ],
      ),
    );
  }
}
