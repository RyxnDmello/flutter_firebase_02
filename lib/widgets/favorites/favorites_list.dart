import 'package:flutter/material.dart';

import '../../models/favorite_model.dart';

import './list/favorites_list_city.dart';

class FavoritesList extends StatelessWidget {
  const FavoritesList({
    required this.favorites,
    super.key,
  });

  final List<FavoriteModel> favorites;

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
