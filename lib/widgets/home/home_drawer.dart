import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './drawer/home_drawer_account.dart';
import './drawer/home_drawer_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    required this.username,
    required this.email,
    super.key,
  });

  final String username;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HomeDrawerAccount(
            username: username,
            profileImage: null,
            profileAvatar: "./lib/images/register/avatar-1.png",
          ),
          const SizedBox(
            height: 15,
          ),
          const HomeDrawerTile(
            icon: FontAwesomeIcons.circleUser,
            label: "Account",
          ),
          const HomeDrawerTile(
            icon: FontAwesomeIcons.heart,
            label: "Home",
          ),
          const HomeDrawerTile(
            icon: FontAwesomeIcons.map,
            label: "Favorites",
          ),
          const HomeDrawerTile(
            icon: FontAwesomeIcons.magnifyingGlass,
            label: "Search",
          ),
        ],
      ),
    );
  }
}
