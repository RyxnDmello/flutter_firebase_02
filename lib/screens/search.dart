import 'package:flutter/material.dart';

import '../models/weather_model.dart';

import '../widgets/search/search_header.dart';
import '../widgets/search/search_form.dart';

import './home.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    required this.image,
    super.key,
  });

  final String image;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  void _exploreWeather({required WeatherModel weather}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(
            account: null,
            weather: weather,
          );
        },
      ),
    );
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
            color: Colors.white,
          ),
          splashColor: Colors.white,
          splashRadius: 25,
          iconSize: 30,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SearchHeader(
              image: widget.image,
            ),
            const SizedBox(
              height: 40,
            ),
            SearchForm(
              onSubmit: _exploreWeather,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
