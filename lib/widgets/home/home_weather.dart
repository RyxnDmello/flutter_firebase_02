import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/widgets/home/weather/home_weather_essentials.dart';

import './weather/home_weather_location.dart';
import './weather/home_weather_temperature.dart';

class HomeWeather extends StatefulWidget {
  const HomeWeather({super.key});

  @override
  State<HomeWeather> createState() => _HomeWeatherState();
}

class _HomeWeatherState extends State<HomeWeather> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeWeatherLocation(
            location: "Toronto Ontario",
          ),
          SizedBox(
            height: 40,
          ),
          HomeWeatherTemperature(
            temperature: "36",
          ),
          SizedBox(
            height: 20,
          ),
          HomeWeatherEssentials(),
        ],
      ),
    );
  }
}
