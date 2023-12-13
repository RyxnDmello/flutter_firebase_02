import 'package:flutter/material.dart';

import '../models/favorite_model.dart';

import '../widgets/favorites/favorites_header.dart';
import '../widgets/favorites/favorites_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    required this.favorites,
    super.key,
  });

  final List<FavoriteModel> favorites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 20),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          splashRadius: 25,
          iconSize: 30,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FavoritesHeader(
              image: "./lib/images/favorites/location.png",
            ),
            const SizedBox(
              height: 50,
            ),
            FavoritesList(
              favorites: favorites,
            ),
          ],
        ),
      ),
    );
  }
}
