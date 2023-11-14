import 'package:flutter/material.dart';

import '../widgets/home/home_app_bar.dart';
import '../widgets/home/home_drawer.dart';
import '../widgets/home/home_weather.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      drawer: const HomeDrawer(
        profileAvatar: "./lib/images/register/avatar-1.png",
        profileImage: null,
        username: "RyanDmello",
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
