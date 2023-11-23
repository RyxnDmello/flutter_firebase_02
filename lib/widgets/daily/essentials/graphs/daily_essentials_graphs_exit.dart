import 'package:flutter/material.dart';

class DailyEssentialsGraphsExit extends StatelessWidget {
  const DailyEssentialsGraphsExit({
    required this.onPressed,
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30,
      splashRadius: 30,
      icon: const Icon(
        Icons.close_sharp,
        color: Colors.white,
      ),
    );
  }
}
