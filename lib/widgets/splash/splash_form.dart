import 'package:flutter/material.dart';

import '../../database/account_manager.dart';
import '../../database/weather_manager.dart';

import '../../models/account_model.dart';
import '../../models/weather_model.dart';

import './form/splash_form_input.dart';
import './form/splash_form_button.dart';

import '../../screens/home.dart';

class SplashForm extends StatefulWidget {
  const SplashForm({super.key});

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {
  final _formKey = GlobalKey<FormState>();
  String? _location;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    await accountManager.setAccountLocation(
      location: _location!,
    );

    final isInitialized = await weatherManager.initializeWeather(
      location: _location!,
    );

    if (!isInitialized) return;

    final account = await accountManager.account();
    final weather = weatherManager.weather();

    _openHomeScreen(
      account: account,
      weather: weather!,
    );
  }

  String? _validateLocation(String? city) {
    if (city!.isEmpty || city.length < 4) {
      return "INVALID CITY NAME";
    }

    return null;
  }

  void _saveLocation(String? city) {
    if (city == null) return;
    _location = city;
  }

  void _openHomeScreen({
    required AccountModel account,
    required WeatherModel weather,
  }) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return HomeScreen(
            account: account,
            weather: weather,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashFormInput(
              validateInput: _validateLocation,
              saveInput: _saveLocation,
            ),
            const SizedBox(
              height: 15,
            ),
            SplashFormButton(
              onSubmit: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
