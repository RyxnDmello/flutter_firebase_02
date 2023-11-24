import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/weather/daily/weather_daily_hourly_model.dart';

class DailyEssentialsBlock extends StatelessWidget {
  const DailyEssentialsBlock({
    required this.onSelect,
    required this.selected,
    required this.title,
    required this.image,
    required this.value,
    super.key,
  });

  final void Function(HourlyWeatherType type) onSelect;
  final HourlyWeatherType selected;
  final String title;
  final String image;
  final String value;

  @override
  Widget build(BuildContext context) {
    void invokeOnSelect() {
      switch (title) {
        case "Rain":
          onSelect(HourlyWeatherType.precipitation);
          break;

        case "Humidity":
          onSelect(HourlyWeatherType.humidity);
          break;

        case "Wind":
          onSelect(HourlyWeatherType.wind);
          break;

        case "Dew":
          onSelect(HourlyWeatherType.dew);
          break;

        case "Pressure":
          onSelect(HourlyWeatherType.pressure);
          break;

        case "Cover":
          onSelect(HourlyWeatherType.cover);
          break;
      }
    }

    Color selectedColor() {
      if (selected == HourlyWeatherType.precipitation && title == "Rain") {
        return const Color.fromARGB(255, 0, 0, 200);
      }

      if ("${selected.name[0].toUpperCase()}${selected.name.substring(1)}" ==
          title) {
        return const Color.fromARGB(255, 0, 0, 200);
      }

      return const Color.fromARGB(255, 0, 0, 100);
    }

    String getPostFix() {
      if (title == "Pressure") {
        return "mb";
      }

      if (title == "Wind") {
        return "kph";
      }

      if (title == "Dew") {
        return "°C";
      }

      return "%";
    }

    return GestureDetector(
      onTap: () => invokeOnSelect(),
      child: Container(
        width: 115,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            color: selectedColor(),
            width: 2,
          ),
          color: const Color.fromARGB(255, 0, 0, 40),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              width: 40,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "$value${getPostFix()}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 0.5,
                fontSize: 18,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: const Color.fromARGB(180, 255, 255, 255),
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
