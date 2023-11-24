import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

SideTitles leftTiles() {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) => _tileLabel(
      value.round().toInt().toString(),
    ),
  );
}

Text _tileLabel(String message) {
  return Text(
    message,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 0.5,
      fontSize: 12.5,
    ),
  );
}
