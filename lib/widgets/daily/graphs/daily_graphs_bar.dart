import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/daily/weather_daily_hourly_model.dart';

import './bar/daily_graphs_bar_groups_data.dart';
import './bar/daily_graphs_bar_bottom_tiles.dart';
import './bar/daily_graphs_bar_left_tiles.dart';

class DailyGraphsBar extends StatelessWidget {
  const DailyGraphsBar({
    required this.hourly,
    required this.weatherType,
    required this.graphTitle,
    required this.barColor,
    this.sidePadding = 0,
    this.barWidth = 6.5,
    this.graphMax = 100,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;
  final double sidePadding;
  final String graphTitle;
  final double barWidth;
  final double graphMax;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          graphTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: 0,
          ),
          height: 200,
          child: BarChart(
            BarChartData(
              maxY: graphMax,
              barGroups: barChartGroupsData(
                weatherType: weatherType,
                hourly: hourly,
                color: barColor,
                width: barWidth,
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: bottomTiles(),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: leftTiles(),
                ),
              ),
              alignment: BarChartAlignment.spaceEvenly,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }
}
