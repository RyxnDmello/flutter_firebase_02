import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer/home_drawer_account.dart';
import 'drawer/home_drawer_tile.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    required this.profileAvatar,
    required this.profileImage,
    required this.username,
    super.key,
  });

  final String? profileAvatar;
  final File? profileImage;
  final String username;

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
            profileAvatar: profileAvatar,
          ),
          const SizedBox(
            height: 15,
          ),
          HomeDrawerTile(
            onTapTile: () {},
            icon: FontAwesomeIcons.circleUser,
            label: "Account",
          ),
          HomeDrawerTile(
            onTapTile: () {},
            icon: FontAwesomeIcons.heart,
            label: "Home",
          ),
          HomeDrawerTile(
            onTapTile: () {},
            icon: FontAwesomeIcons.map,
            label: "Favorites",
          ),
          HomeDrawerTile(
            onTapTile: () {},
            icon: FontAwesomeIcons.magnifyingGlass,
            label: "Search",
          ),
          const SizedBox(
            height: 15,
          ),
          HomeDrawerTile(
            onTapTile: () => FirebaseAuth.instance.signOut(),
            icon: FontAwesomeIcons.arrowRightFromBracket,
            label: "Logout",
          ),
        ],
      ),
    );
  }
}
