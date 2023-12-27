import 'package:flutter/material.dart';

import '../database/account_manager.dart';
import '../database/weather_manager.dart';

import '../models/account_model.dart';

import '../widgets/common/warning_snack_bar.dart';

import '../widgets/splash/splash_logo.dart';
import '../widgets/splash/splash_message.dart';
import '../widgets/splash/splash_form.dart';

import '../screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<AccountModel?> _isLocationAuthenticated() async {
    return await accountManager.account();
  }

  Future<void> _openHomeScreen({required AccountModel account}) async {
    final weather = await weatherManager.weather(
      location: account.location,
    );

    if (weather == null) {
      _warningMessage(
        message: "SERVER DOWN / INVALID CITY",
        icon: Icons.wifi_off_sharp,
      );

      return;
    }

    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              favoriteID: null,
              account: account,
              weather: weather,
            ),
          ),
        );
      },
    );
  }

  void _warningMessage({
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AccountModel?>(
      future: _isLocationAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _openHomeScreen(
            account: snapshot.data!,
          );
        }

        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage(
                  "./lib/images/splash/background.png",
                ),
                fit: BoxFit.cover,
                opacity: 0.65,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SplashLogo(),
                  SizedBox(
                    height: !snapshot.hasData ? 150 : 250,
                  ),
                  SplashMessage(
                    title: !snapshot.hasData
                        ? "LET'S GET STARTED"
                        : "SYNCING THE CLOUD",
                    description: !snapshot.hasData
                        ? "Enter Your City"
                        : "Fetching Weather...",
                    icon: !snapshot.hasData
                        ? Icons.location_on_outlined
                        : Icons.location_on_sharp,
                  ),
                  if (!snapshot.hasData)
                    const SizedBox(
                      height: 40,
                    ),
                  if (!snapshot.hasData) const SplashForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
