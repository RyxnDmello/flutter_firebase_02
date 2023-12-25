import 'package:flutter/material.dart';

import '../database/account_manager.dart';
import '../database/weather_manager.dart';
import '../database/favorites_manager.dart';

import '../models/account_model.dart';
import '../models/weather_model.dart';
import '../models/favorite_model.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/home_weather.dart';
import '../widgets/home/home_search.dart';

import './account.dart';
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
  AccountModel? _account;
  WeatherModel? _weather;

  @override
  void initState() {
    super.initState();
    _account = widget.account;
    _weather = widget.weather;
  }

  void _openAccountScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AccountScreen(
          updateAccount: _updateAccount,
          account: _account!,
        ),
      ),
    );
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

  Future<void> _refreshWeather() async {
    final weather = await weatherManager.weather(
      location: _account!.location,
    );

    setState(() => _weather = weather);
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

  Future<void> _updateAccount() async {
    final account = await accountManager.account();
    setState(() => _account = account);

    await _refreshWeather();
  }

  @override
  Widget build(BuildContext context) {
    if (_account == null) {
      return HomeSearch(
        favoriteID: widget.favoriteID,
        weather: widget.weather,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: HomeDrawer(
        username: _account!.username,
        profile: _account!.profile,
        onTapAccount: _openAccountScreen,
        onTapMap: _openFavoritesScreen,
        onTapSearch: _openSearchScreen,
        onTapRefresh: _refreshWeather,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                onTapProfile: () => _scaffoldKey.currentState!.openDrawer(),
                profile: _account!.profile,
                onTapMap: _openFavoritesScreen,
                onTapSearch: _openSearchScreen,
                onTapRefresh: _refreshWeather,
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
