import 'package:flutter/material.dart';

import '../database/favorites_manager.dart';
import '../database/weather_manager.dart';

import '../models/favorite_model.dart';
import '../models/weather_model.dart';

import '../widgets/common/warning_snack_bar.dart';
import '../widgets/common/loading_indicator.dart';

import '../widgets/favorites/favorites_header.dart';
import '../widgets/favorites/favorites_list.dart';
import '../widgets/favorites/favorites_empty.dart';

import './home.dart';
import './search.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    required this.favorites,
    super.key,
  });

  final List<FavoriteModel> favorites;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<FavoriteModel> _favorites = [];

  @override
  void initState() {
    super.initState();
    _favorites = widget.favorites;
  }

  Future<void> _updateFavorites() async {
    loadingIndicator(
      context: context,
    );

    final favorites = await favoritesManager.favorites();
    setState(() => _favorites = favorites ?? []);

    _closeLoadingIndicator();
  }

  Future<void> _exploreWeather({
    required String favoriteID,
    required String location,
  }) async {
    loadingIndicator(
      context: context,
    );

    final weather = await weatherManager.weather(
      location: location,
    );

    _closeLoadingIndicator();

    if (weather == null) {
      _warningMessage(
        message: "THE SERVER IS DOWN",
        icon: Icons.wifi_off,
      );

      return;
    }

    _openHomeScreen(
      favoriteID: favoriteID,
      weather: weather,
    );
  }

  Future<void> _removeFavorite({
    required String favoriteID,
  }) async {
    await favoritesManager.removeFavorite(
      favoriteID: favoriteID,
    );

    await _updateFavorites();
  }

  Future<void> _openHomeScreen({
    required WeatherModel weather,
    required String favoriteID,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          favoriteID: favoriteID,
          weather: weather,
          account: null,
        ),
      ),
    );

    await _updateFavorites();
  }

  void _openSearchScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return const SearchScreen(
            image: "./lib/images/weather/clear-day.png",
          );
        },
      ),
    );
  }

  void _warningMessage({
    required String message,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      warningSnackBar(
        message: message,
        icon: icon,
      ),
    );
  }

  void _closeLoadingIndicator() {
    Navigator.of(context).pop();
  }

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
            SizedBox(
              height: _favorites.isNotEmpty ? 50 : 120,
            ),
            if (_favorites.isEmpty)
              FavoritesEmpty(
                image: "./lib/images/favorites/empty.png",
                onTapSearch: _openSearchScreen,
                message: "NO PLACES SAVED",
              ),
            if (_favorites.isNotEmpty)
              FavoritesList(
                favorites: _favorites,
                onExplore: _exploreWeather,
                onRemove: _removeFavorite,
              ),
          ],
        ),
      ),
    );
  }
}
