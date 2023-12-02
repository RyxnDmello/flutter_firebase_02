import 'package:flutter/material.dart';

import '../database/weather_manager.dart';

import '../models/account_model.dart';
import '../models/weather_model.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/home_weather.dart';
import '../widgets/home/home_favorites.dart';

import './favorites.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.account,
    required this.weather,
    super.key,
  });

  final AccountModel? account;
  final WeatherModel weather;

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

  Future<void> _updateWeather() async {
    final weather = await weatherManager.weather(
      location: widget.account!.location,
    );

    setState(() => _weather = weather);
  }

  void _openFavoritesScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const FavoritesScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.account == null) {
      return HomeFavorites(
        weather: widget.weather,
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: HomeDrawer(
        username: widget.account!.username,
        profile: widget.account!.profile,
        onTapSearch: _openFavoritesScreen,
        onTapRefresh: _updateWeather,
        onTapAccount: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                profile: widget.account!.profile,
                onTapProfile: () => _scaffoldKey.currentState!.openDrawer(),
                onTapSearch: _openFavoritesScreen,
                onTapRefresh: _updateWeather,
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
