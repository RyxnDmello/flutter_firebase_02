import 'package:flutter/material.dart';

void loadingIndicator({
  required BuildContext context,
  Color? backgroundColor,
  Color? indicatorColor,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: indicatorColor ?? const Color.fromARGB(255, 0, 50, 255),
          backgroundColor: backgroundColor ?? Colors.black26,
        ),
      );
    },
  );
}
