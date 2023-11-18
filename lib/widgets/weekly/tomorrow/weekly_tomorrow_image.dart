import 'package:flutter/material.dart';

class WeeklyTomorrowImage extends StatelessWidget {
  const WeeklyTomorrowImage({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 165,
    );
  }
}
