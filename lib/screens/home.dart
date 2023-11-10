import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/widgets/home/home_weather.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: const HomeDrawer(
        username: "RyanDmello",
        email: "ryan@gmail.com",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HomeAppBar(
                onTapProfile: () => scaffoldKey.currentState!.openDrawer(),
              ),
              const SizedBox(
                height: 15,
              ),
              const HomeWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
