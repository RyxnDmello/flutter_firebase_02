import 'package:flutter/material.dart';

import '../../database/favorites_manager.dart';

import '../../models/weather_model.dart';

import '../common/loading_indicator.dart';
import '../common/warning_snack_bar.dart';

import './home_weather.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({
    required this.favoriteID,
    required this.weather,
    super.key,
  });

  final WeatherModel weather;
  final String? favoriteID;

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  String? _favoriteID;

  Future<void> _addFavorite() async {
    loadingIndicator(
      context: context,
    );

    final favoriteID = await favoritesManager.addFavorite(
      weather: widget.weather,
    );

    _removeLoadingIndicator();

    if (favoriteID != null) {
      setState(() => _favoriteID = favoriteID);
      return;
    }

    _warningMessage(
      message: "SERVER IS DOWN",
      icon: Icons.wifi_off_sharp,
    );
  }

  Future<void> _removeFavorite() async {
    loadingIndicator(
      context: context,
    );

    final isRemoved = await favoritesManager.removeFavorite(
      favoriteID: _favoriteID!,
    );

    _removeLoadingIndicator();

    if (isRemoved) {
      setState(() => _favoriteID = null);
      return;
    }

    _warningMessage(
      message: "SERVER IS DOWN",
      icon: Icons.wifi_off_sharp,
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

  void _removeLoadingIndicator() {
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
        actions: [
          IconButton(
            onPressed: () async => _favoriteID == null
                ? await _addFavorite()
                : await _removeFavorite(),
            icon: Icon(
              _favoriteID == null ? Icons.favorite_border : Icons.favorite,
            ),
            color: Colors.white,
            splashRadius: 25,
            iconSize: 30,
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 20,
          top: 10,
        ),
        child: HomeWeather(
          weather: widget.weather,
        ),
      ),
    );
  }
}
