import 'package:flutter/material.dart';

import '../../database/weather_manager.dart';

import '../../models/weather_model.dart';

import '../common/warning_snack_bar.dart';
import '../common/loading_indicator.dart';

import './form/search_form_input.dart';
import './form/search_form_button.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    required this.exploreWeather,
    super.key,
  });

  final Function({required WeatherModel weather}) exploreWeather;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? location;

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

    void removeLoadingIndicator() {
      Navigator.of(context).pop();
    }

    Future<void> submitForm() async {
      formKey.currentState!.save();

      if (location!.length < 4) {
        warningMessage(
          message: "PLEASE ENTER A CITY",
          icon: Icons.error_outline,
        );

        return;
      }

      loadingIndicator(context: context);

      final weather = await weatherManager.weather(
        location: location!,
      );

      formKey.currentState!.reset();

      if (weather == null) {
        warningMessage(
          message: "SERVER DOWN / INVALID CITY",
          icon: Icons.wifi_off_sharp,
        );

        removeLoadingIndicator();

        return;
      }

      exploreWeather(weather: weather);
    }

    void saveLocation(String? loc) {
      location = loc;
    }

    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: FavoritesSearchInput(
              saveInput: saveLocation,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          FavoritesSearchButton(
            onSubmit: submitForm,
          ),
        ],
      ),
    );
  }
}
