import 'package:flutter/material.dart';

import '../models/account_model.dart';
import '../models/weather_model.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/home_weather.dart';
import '../widgets/home/home_favorites.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.account,
    required this.weather,
    super.key,
  });

  final AccountModel? account;
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    if (account == null) {
      return HomeFavorites(
        weather: weather,
      );
    }

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: HomeDrawer(
        username: account!.username,
        profile: account!.profile,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                onTapProfile: () => scaffoldKey.currentState!.openDrawer(),
              ),
              const SizedBox(
                height: 15,
              ),
              HomeWeather(
                weather: weather,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
