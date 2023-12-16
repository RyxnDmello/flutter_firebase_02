import 'package:flutter/material.dart';

import '../../models/favorite_model.dart';

import './list/favorites_list_city.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    required this.favorites,
    required this.onExplore,
    required this.onRemove,
    super.key,
  });

  final List<FavoriteModel> favorites;

  final Future<void> Function({
    required String favoriteID,
  }) onRemove;

  final Future<void> Function({
    required String favoriteID,
    required String location,
  }) onExplore;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return FavoritesListCity(
          id: favorites[index].id,
          location: favorites[index].location,
          latitude: favorites[index].latitude,
          longitude: favorites[index].longitude,
          timezone: favorites[index].timezone,
          onExplore: onExplore,
          onRemove: onRemove,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12.5,
        );
      },
    );
  }
}
