import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

SideTitles bottomTiles() {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      if (value > 9) {
        return _tileLabel(
          value.round().toInt().toString(),
        );
      }

      return _tileLabel(
        "0${value.round().toInt().toString()}",
      );
    },
  );
}

Column _tileLabel(String message) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(
        height: 2.5,
      ),
      Text(
        message,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          letterSpacing: 0.5,
          fontSize: 12.5,
        ),
      ),
    ],
  );
}
