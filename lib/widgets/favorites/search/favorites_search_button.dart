import 'package:flutter/material.dart';

class FavoritesSearchButton extends StatelessWidget {
  const FavoritesSearchButton({
    required this.onSubmit,
    super.key,
  });

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onSubmit,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(15),
        shape: const CircleBorder(),
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: const Icon(
        // Icons.location_on_outlined,
        Icons.place_outlined,
        color: Colors.white,
        size: 25,
      ),
    );
  }
}
