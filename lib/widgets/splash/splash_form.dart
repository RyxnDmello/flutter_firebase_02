import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './form/splash_form_input.dart';
import './form/splash_form_button.dart';

class SplashForm extends StatefulWidget {
  const SplashForm({super.key});

  @override
  State<SplashForm> createState() => _SplashFormState();
}

class _SplashFormState extends State<SplashForm> {
  final _formKey = GlobalKey<FormState>();
  String? _city;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (kDebugMode) {
      print(_city);
    }
  }

  String? _validateCity(String? city) {
    if (city!.isEmpty || city.length < 4 || city.contains(" ")) {
      return "INVALID CITY NAME";
    }

    return null;
  }

  void _saveCity(String? city) {
    if (city == null) return;
    _city = city;
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
              validateInput: _validateCity,
              saveInput: _saveCity,
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
