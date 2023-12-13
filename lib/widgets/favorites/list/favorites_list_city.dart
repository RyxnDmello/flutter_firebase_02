import 'package:flutter/material.dart';

import './city/favorites_list_city_details.dart';

class FavoritesListCity extends StatelessWidget {
  const FavoritesListCity({
    required this.id,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    super.key,
  });

  final String id;
  final String location;
  final String latitude;
  final String longitude;
  final String timezone;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          color: Color.fromARGB(255, 0, 0, 40),
        ),
        child: FavoritesListCityDetails(
          location: location,
          latitude: latitude,
          longitude: longitude,
          timezone: timezone,
        ),
      ),
    );
  }
}
