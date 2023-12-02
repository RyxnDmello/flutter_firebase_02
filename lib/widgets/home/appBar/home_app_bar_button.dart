import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBarButton extends StatelessWidget {
  const HomeAppBarButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: FaIcon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
