import 'package:flutter/material.dart';
import 'package:flutter_firebase_02/widgets/home/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 25),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 25),
      ),
      drawer: const HomeDrawer(
        username: "RyanDmello",
        email: "ryan@gmail.com",
      ),
    );
  }
}
