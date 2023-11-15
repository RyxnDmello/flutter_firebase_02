import 'package:flutter/material.dart';

class WeeklyDaysCardImage extends StatelessWidget {
  const WeeklyDaysCardImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 45,
      fit: BoxFit.cover,
    );
  }
}
