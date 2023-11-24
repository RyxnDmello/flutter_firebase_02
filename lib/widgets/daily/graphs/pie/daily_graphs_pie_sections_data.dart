import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

import '../utils/daily_graphs_hourly_data.dart';

List<PieChartSectionData> pieChartSectionsData({
  required List<WeatherDailyHourlyModel> hourly,
  required HourlyWeatherType weatherType,
  required Color color,
}) {
  return getHourlyData(hourly).asMap().entries.map((element) {
    if (weatherType == HourlyWeatherType.precipitation) {
      return _getPieChartSectionData(
        value: element.value.precipitation,
        hour: element.value.hour,
        color: color,
      );
    }

    if (weatherType == HourlyWeatherType.humidity) {
      return _getPieChartSectionData(
        value: element.value.humidity,
        hour: element.value.hour,
        color: color,
      );
    }

    if (weatherType == HourlyWeatherType.pressure) {
      return _getPieChartSectionData(
        value: element.value.pressure,
        hour: element.value.hour,
        color: color,
      );
    }

    if (weatherType == HourlyWeatherType.wind) {
      return _getPieChartSectionData(
        value: element.value.wind,
        hour: element.value.hour,
        color: color,
      );
    }

    if (weatherType == HourlyWeatherType.dew) {
      return _getPieChartSectionData(
        value: element.value.dew,
        hour: element.value.hour,
        color: color,
      );
    }

    return _getPieChartSectionData(
      value: element.value.temperature,
      hour: element.value.hour,
      color: color,
    );
  }).toList();
}

PieChartSectionData _getPieChartSectionData({
  required String value,
  required String hour,
  required Color color,
}) {
  return PieChartSectionData(
    titlePositionPercentageOffset: 0.65,
    badgePositionPercentageOffset: 1.25,
    titleStyle: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    badgeWidget: Text(
      int.parse(hour) < 12 ? "${hour}Am" : "${hour}Pm",
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0.65,
      ),
    ),
    borderSide: BorderSide(
      color: color,
      width: 2,
    ),
    color: color.withOpacity(0.15),
    value: double.parse(value),
    title: value,
    radius: 90,
  );
}
