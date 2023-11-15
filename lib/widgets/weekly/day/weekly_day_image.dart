import 'package:flutter/material.dart';

class WeeklyDayImage extends StatelessWidget {
  const WeeklyDayImage({
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
