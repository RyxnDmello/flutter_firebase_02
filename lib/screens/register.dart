import 'package:flutter/material.dart';

import "../widgets/register/register_logo.dart";
import '../widgets/register/register_title.dart';
import '../widgets/register/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "./lib/images/background.png",
            ),
            opacity: 0.65,
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RegisterLogo(),
              RegisterTitle(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
