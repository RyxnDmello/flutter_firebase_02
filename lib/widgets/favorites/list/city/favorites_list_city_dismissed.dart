import 'package:flutter/material.dart';

class FavoritesListCityDismissed extends StatelessWidget {
  const FavoritesListCityDismissed({
    required this.alignment,
    super.key,
  });

  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 255, 0, 0),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(
        Icons.remove_circle_outline_sharp,
        color: Colors.red,
        size: 30,
      ),
    );
  }
}
