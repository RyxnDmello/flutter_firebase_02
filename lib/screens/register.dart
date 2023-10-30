import 'package:flutter/material.dart';

import "../widgets/register/register_logo.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RegisterLogo(),
      ),
    );
  }
}
