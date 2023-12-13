import 'package:flutter/material.dart';

import '../database/weather_manager.dart';
import '../database/favorites_manager.dart';

import '../models/account_model.dart';
import '../models/weather_model.dart';
import '../models/favorite_model.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/home_weather.dart';
import '../widgets/home/home_search.dart';

import './favorites.dart';
import './search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.favoriteID,
    required this.account,
    required this.weather,
    super.key,
  });

  final AccountModel? account;
  final WeatherModel weather;
  final String? favoriteID;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  WeatherModel? _weather;

  @override
  void initState() {
    super.initState();
    _weather = widget.weather;
  }

  Future<void> _refreshWeather() async {
    _scaffoldKey.currentState!.closeDrawer();

    final weather = await weatherManager.weather(
      location: widget.account!.location,
    );

    setState(() => _weather = weather);
  }

  Future<void> _openFavoritesScreen() async {
    final favorites = await favoritesManager.favorites();

    if (favorites == null) return;

    _favoritesScreen(
      favorites: favorites,
    );
  }

  void _openSearchScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return SearchScreen(
            image: _weather!.temperature.image,
          );
        },
      ),
    );
  }

  void _favoritesScreen({
    required List<FavoriteModel> favorites,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FavoritesScreen(
            favorites: favorites,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.account == null) {
      return HomeSearch(
        favoriteID: widget.favoriteID,
        weather: widget.weather,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: HomeDrawer(
        username: widget.account!.username,
        profile: widget.account!.profile,
        onTapMap: _openFavoritesScreen,
        onTapSearch: _openSearchScreen,
        onTapRefresh: _refreshWeather,
        onTapAccount: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                onTapProfile: () => _scaffoldKey.currentState!.openDrawer(),
                profile: widget.account!.profile,
                onTapSearch: _openSearchScreen,
                onTapRefresh: _refreshWeather,
                onTapMap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              HomeWeather(
                weather: _weather!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
