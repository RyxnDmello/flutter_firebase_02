import 'package:flutter/material.dart';

import '../../database/weather_manager.dart';

import '../../models/weather_model.dart';

import '../common/warning_snack_bar.dart';

import './form/search_form_input.dart';
import './form/search_form_button.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    required this.onSubmit,
    super.key,
  });

  final Function({required WeatherModel weather}) onSubmit;

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

    Future<void> submitForm() async {
      formKey.currentState!.save();

      if (location!.length < 4) {
        warningMessage(
          message: "INVALID CITY",
          icon: Icons.error_outline,
        );

        return;
      }

      final weather = await weatherManager.weather(
        location: location!,
      );

      formKey.currentState!.reset();

      if (weather == null) {
        warningMessage(
          message: "SERVER DOWN / INVALID CITY",
          icon: Icons.wifi_off_sharp,
        );

        return;
      }

      onSubmit(weather: weather);
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
