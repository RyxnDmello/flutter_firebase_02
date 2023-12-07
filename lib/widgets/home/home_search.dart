import 'package:flutter/material.dart';

import '../../models/weather_model.dart';

import './home_weather.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    required this.weather,
    super.key,
  });

  final WeatherModel weather;

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
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
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
          weather: weather,
        ),
      ),
    );
  }
}
