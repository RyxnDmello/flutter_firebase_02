import 'package:flutter/material.dart';

import '../widgets/register/register_logo.dart';
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
            image: AssetImage(
              "./lib/images/register/background.png",
            ),
            fit: BoxFit.cover,
            opacity: 0.65,
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RegisterLogo(),
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}
