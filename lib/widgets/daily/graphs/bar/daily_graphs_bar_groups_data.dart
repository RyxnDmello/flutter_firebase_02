import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

List<BarChartGroupData> barChartGroupsData({
  required List<WeatherDailyHourlyModel> hourly,
  required HourlyWeatherType weatherType,
  required double width,
  required Color color,
}) {
  List<BarChartGroupData> groupsData = _getHourlyData(hourly).map((hour) {
    return BarChartGroupData(
      x: int.parse(hour.hour),
      barRods: [
        if (weatherType == HourlyWeatherType.temperature)
          _getBarChartRodData(
            value: hour.temperature,
            color: color,
            width: width,
          ),
        if (weatherType == HourlyWeatherType.precipitation)
          _getBarChartRodData(
            value: hour.precipitation,
            color: color,
            width: width,
          ),
        if (weatherType == HourlyWeatherType.humidity)
          _getBarChartRodData(
            value: hour.humidity,
            color: color,
            width: width,
          ),
        if (weatherType == HourlyWeatherType.pressure)
          _getBarChartRodData(
            value: hour.pressure,
            color: color,
            width: width,
          ),
        if (weatherType == HourlyWeatherType.wind)
          _getBarChartRodData(
            value: hour.wind,
            color: color,
            width: width,
          ),
        if (weatherType == HourlyWeatherType.dew)
          _getBarChartRodData(
            value: hour.dew,
            color: color,
            width: width,
          ),
      ],
    );
  }).toList();

  return groupsData;
}

BarChartRodData _getBarChartRodData({
  required String value,
  required Color color,
  required double width,
}) {
  return BarChartRodData(
    toY: double.parse(value),
    color: color,
    width: width,
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
