import 'package:flutter/material.dart';

import '../../models/weather_model.dart';
import '../../models/search_model.dart';

import './popular/search_popular_city.dart';

class SearchPopular extends StatelessWidget {
  const SearchPopular({
    required this.exploreWeather,
    super.key,
  });

  final Function({required WeatherModel weather}) exploreWeather;

  @override
  Widget build(BuildContext context) {
    popular.shuffle();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: popular.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return SearchPopularCity(
          exploreWeather: exploreWeather,
          image: popular[index].image,
          name: popular[index].name,
        );
      },
    );
  }
}
