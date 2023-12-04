import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../database/weather_manager.dart';

import '../../common/warning_snack_bar.dart';
import '../../common/loading_indicator.dart';

import '../../../models/weather_model.dart';

class SearchPopularCity extends StatelessWidget {
  const SearchPopularCity({
    required this.exploreWeather,
    required this.image,
    required this.name,
    super.key,
  });

  final Function({required WeatherModel weather}) exploreWeather;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    void warningMessage({
      required String message,
      required IconData icon,
    }) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        warningSnackBar(
          message: message,
          icon: icon,
        ),
      );
    }

    Future<void> onSearchCity() async {
      loadingIndicator(context: context);

      final weather = await weatherManager.weather(
        location: name,
      );

      if (weather == null) {
        warningMessage(
          message: "THE SERVER IS DOWN",
          icon: Icons.wifi_off_sharp,
        );

        return;
      }

      exploreWeather(weather: weather);
    }

    return GestureDetector(
      onTap: () async => await onSearchCity(),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            opacity: 0.85,
          ),
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          clipBehavior: Clip.hardEdge,
          children: [
            const Positioned(
              right: 0,
              bottom: 0,
              child: Icon(
                Icons.open_in_new_rounded,
                color: Colors.white,
              ),
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
