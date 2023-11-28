import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/screens/home.dart';

import '../database/weather_manager.dart';

import '../models/weather_model.dart';

import '../widgets/splash/splash_logo.dart';
import '../widgets/splash/splash_message.dart';
import '../widgets/splash/splash_form.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    required this.isLogin,
    super.key,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    Future<void> openHomeScreen() async {
      await weatherManager.initializeWeatherData(
        city: "Bengaluru",
      );

      await Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                weather: weatherManager.weatherModel() ?? dummyWeather,
              ),
            ),
          );
        },
      );
    }

    if (isLogin) openHomeScreen();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
              "./lib/images/register/background.png",
            ),
            fit: BoxFit.cover,
            opacity: 0.65,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SplashLogo(),
              SizedBox(
                height: isLogin ? 250 : 150,
              ),
              SplashMessage(
                title: isLogin ? "SYNCING THE CLOUD" : "LET'S GET STARTED",
                description:
                    isLogin ? "Fetching Weather..." : "Enter Your City",
                icon: isLogin
                    ? Icons.location_on_sharp
                    : Icons.location_on_outlined,
              ),
              if (!isLogin)
                const SizedBox(
                  height: 40,
                ),
              if (!isLogin) const SplashForm(),
            ],
          ),
        ),
      ),
    );
  }
}
