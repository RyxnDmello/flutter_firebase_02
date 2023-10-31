import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './form/register_form_profile_image.dart';
import './form/register_form_input.dart';
import './form/register_form_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  File? profileImage;

  void _openCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 60,
    );

    if (pickedImage == null) return;

    setState(() => profileImage = File(pickedImage.path));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegisterFormProfileImage(
              onOpenCamera: _openCamera,
              profileImage: profileImage,
            ),
            const SizedBox(
              height: 20,
            ),
            const RegisterFormInput(
              label: "Username",
            ),
            const SizedBox(
              height: 16.5,
            ),
            const RegisterFormInput(
              label: "Email Address",
            ),
            const SizedBox(
              height: 16.5,
            ),
            const RegisterFormInput(
              label: "Password",
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            const RegisterFormButton(),
          ],
        ),
      ),
    );
  }
}
