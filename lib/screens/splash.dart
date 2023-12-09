import 'package:flutter/material.dart';

import '../database/account_manager.dart';
import '../database/weather_manager.dart';

import '../widgets/splash/splash_logo.dart';
import '../widgets/splash/splash_message.dart';
import '../widgets/splash/splash_form.dart';

import '../screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    required this.isLogin,
    super.key,
  });

  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    Future<void> openHomeScreen() async {
      final account = await accountManager.account();

      final weather = await weatherManager.weather(
        location: account.location,
      );

      if (weather == null) return;

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

    if (isLogin) openHomeScreen();

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
