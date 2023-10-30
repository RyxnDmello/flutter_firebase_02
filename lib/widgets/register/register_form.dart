import 'package:flutter/material.dart';

import './form/register_form_input.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Form(
        key: _formKey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegisterFormInput(
              label: "Username",
            ),
            SizedBox(
              height: 16.5,
            ),
            RegisterFormInput(
              label: "Email Address",
            ),
            SizedBox(
              height: 16.5,
            ),
            RegisterFormInput(
              label: "Password",
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }
}
