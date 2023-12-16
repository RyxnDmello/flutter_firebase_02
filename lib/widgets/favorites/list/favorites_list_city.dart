import 'package:flutter/material.dart';

import './city/favorites_list_city_details.dart';
import './city/favorites_list_city_dismissed.dart';

class FavoritesListCity extends StatelessWidget {
  const FavoritesListCity({
    required this.id,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.onRemove,
    required this.onExplore,
    super.key,
  });

  final String id;
  final String location;
  final String latitude;
  final String longitude;
  final String timezone;

  final Future<void> Function({
    required String favoriteID,
  }) onRemove;

  final Future<void> Function({
    required String favoriteID,
    required String location,
  }) onExplore;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      onDismissed: (dismissDirection) async {
        await onRemove(favoriteID: id);
      },
      direction: DismissDirection.horizontal,
      background: const FavoritesListCityDismissed(
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: const FavoritesListCityDismissed(
        alignment: Alignment.centerRight,
      ),
      child: GestureDetector(
        onTap: () async => await onExplore(
          favoriteID: id,
          location: location,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 40),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FavoritesListCityDetails(
            location: location,
            latitude: latitude,
            longitude: longitude,
            timezone: timezone,
          ),
        ),
      ),
    );
  }
}
