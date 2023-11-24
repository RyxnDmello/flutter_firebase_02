import 'package:fl_chart/fl_chart.dart';

import '../../../../models/weather/daily/weather_daily_hourly_model.dart';

import '../utils/daily_graphs_hourly_data.dart';

List<FlSpot> lineChartSpotsData({
  required List<WeatherDailyHourlyModel> hourly,
  required HourlyWeatherType weatherType,
}) {
  return getHourlyData(hourly).map((hour) {
    if (weatherType == HourlyWeatherType.precipitation) {
      return FlSpot(
        double.parse(hour.hour),
        double.parse(hour.precipitation),
      );
    }

    if (weatherType == HourlyWeatherType.humidity) {
      return FlSpot(
        double.parse(hour.hour),
        double.parse(hour.humidity),
      );
    }

    if (weatherType == HourlyWeatherType.pressure) {
      return FlSpot(
        double.parse(hour.hour),
        double.parse(hour.pressure),
      );
    }

    if (weatherType == HourlyWeatherType.wind) {
      return FlSpot(
        double.parse(hour.hour),
        double.parse(hour.wind),
      );
    }

    if (weatherType == HourlyWeatherType.dew) {
      return FlSpot(
        double.parse(hour.hour),
        double.parse(hour.dew),
      );
    }

    return FlSpot(
      double.parse(hour.hour),
      double.parse(hour.temperature),
    );
  }).toList();
}
