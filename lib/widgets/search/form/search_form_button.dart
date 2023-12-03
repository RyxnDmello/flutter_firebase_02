import 'package:flutter/material.dart';

class FavoritesSearchButton extends StatelessWidget {
  const FavoritesSearchButton({
    required this.onSubmit,
    super.key,
  });

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      onPressed: onSubmit,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      icon: const Icon(
        Icons.place_outlined,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
