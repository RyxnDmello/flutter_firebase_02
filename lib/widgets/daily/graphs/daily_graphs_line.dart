import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/daily/weather_daily_hourly_model.dart';

import './line/daily_graphs_line_data.dart';

import './utils/daily_graphs_bottom_tiles.dart';
import './utils/daily_graphs_left_tiles.dart';

class DailyGraphsLine extends StatelessWidget {
  const DailyGraphsLine({
    required this.hourly,
    required this.weatherType,
    required this.graphTitle,
    required this.barColor,
    this.sidePadding = 0,
    this.graphMax = 100,
    this.barWidth = 2.5,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;
  final String? graphTitle;
  final double sidePadding;
  final double barWidth;
  final double graphMax;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (graphTitle != null)
          Text(
            graphTitle!,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.65,
              fontSize: 20,
            ),
          ),
        if (graphTitle != null)
          const SizedBox(
            height: 15,
          ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: 0,
          ),
          height: 200,
          child: LineChart(
            LineChartData(
              maxY: graphMax,
              lineBarsData: [
                LineChartBarData(
                  spots: lineChartSpotsData(
                    weatherType: weatherType,
                    hourly: hourly,
                  ),
                  barWidth: barWidth,
                  color: barColor,
                )
              ],
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: bottomTiles(),
                ),
                leftTitles: AxisTitles(
                  sideTitles: leftTiles(),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }
}
