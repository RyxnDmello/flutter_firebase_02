import 'package:flutter/material.dart';

import '../widgets/favorites/favorites_header.dart';
import '../widgets/favorites/favorites_search.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
            color: Colors.white,
          ),
          splashColor: Colors.white,
          splashRadius: 25,
          iconSize: 30,
        ),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FavoritesHeader(
              image: "./lib/images/favorites/favorites.png",
            ),
            SizedBox(
              height: 40,
            ),
            FavoritesSearch(),
          ],
        ),
      ),
    );
  }
}
