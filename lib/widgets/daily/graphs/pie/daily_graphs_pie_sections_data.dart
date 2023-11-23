import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

List<PieChartSectionData> pieChartSectionsData({
  required List<WeatherDailyHourlyModel> hourly,
  required HourlyWeatherType weatherType,
  required Color color,
}) {
  return _getHourlyData(hourly).asMap().entries.map((element) {
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
        fontWeight: FontWeight.w400,
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

List<WeatherDailyHourlyModel> _getHourlyData(
  List<WeatherDailyHourlyModel> hourly,
) {
  List<WeatherDailyHourlyModel> graphPoints = [];

  if (DateTime.now().hour > 12) {
    for (var i = 12; i < 24; i++) {
      graphPoints.add(hourly[i]);
    }

    return graphPoints;
  }

  for (var i = 0; i < 12; i++) {
    graphPoints.add(hourly[i]);
  }

  return graphPoints;
}
