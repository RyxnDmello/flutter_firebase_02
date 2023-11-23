import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/daily/weather_daily_hourly_model.dart';

import './pie/daily_graphs_pie_sections_data.dart';

class DailyGraphsPie extends StatelessWidget {
  const DailyGraphsPie({
    required this.hourly,
    required this.weatherType,
    required this.graphTitle,
    required this.graphColor,
    super.key,
  });

  final List<WeatherDailyHourlyModel> hourly;
  final HourlyWeatherType weatherType;
  final String? graphTitle;
  final Color graphColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
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
          Expanded(
            child: PieChart(
              PieChartData(
                sectionsSpace: 5,
                centerSpaceRadius: 20,
                sections: pieChartSectionsData(
                  weatherType: weatherType,
                  color: graphColor,
                  hourly: hourly,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
