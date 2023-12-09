import 'package:flutter/material.dart';

import '../models/weather_model.dart';

import '../widgets/search/search_header.dart';
import '../widgets/search/search_form.dart';
import '../widgets/search/search_popular.dart';

import './home.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    void exploreWeather({required WeatherModel weather}) {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(
              favoriteID: null,
              weather: weather,
              account: null,
            );
          },
        ),
      );
    }

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
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchHeader(
              image: image,
            ),
            const SizedBox(
              height: 40,
            ),
            SearchForm(
              exploreWeather: exploreWeather,
            ),
            const SizedBox(
              height: 40,
            ),
            SearchPopular(
              exploreWeather: exploreWeather,
            ),
          ],
        ),
      ),
    );
  }
}
