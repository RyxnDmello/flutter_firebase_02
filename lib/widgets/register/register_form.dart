import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import './form/register_form_title.dart';
import './form/register_form_profile.dart';
import './form/register_form_avatar_modal.dart';
import './form/register_form_input.dart';
import './form/register_form_button.dart';
import './form/register_form_switcher.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = false;
  File? _profileImage;
  String? _profileAvatar;

  void _openCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 200,
    );

    if (pickedImage == null) return;

    setState(() {
      _profileImage = File(pickedImage.path);
      _profileAvatar = null;
    });
  }

  void _selectAvatar(String selectedImage) {
    Navigator.of(context).pop();

    setState(() {
      _profileAvatar = selectedImage;
      _profileImage = null;
    });
  }

  void _openAvatarModal() {
    showModalBottomSheet(
      useSafeArea: true,
      enableDrag: true,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      context: context,
      builder: (context) {
        return RegisterFormAvatarModal(
          onSelectAvatar: _selectAvatar,
        );
      },
    );
  }

  void _switchForm() {
    setState(() => _isLogin = !_isLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RegisterFormTitle(
              title: _isLogin ? "WELCOME BACK" : "CREATE AN ACCOUNT",
              description: "Sync With The Clouds",
            ),
            SizedBox(
              height: _isLogin ? 100 : 50,
            ),
            if (!_isLogin)
              RegisterFormProfile(
                onOpenCamera: _openCamera,
                onOpenAvatarModal: _openAvatarModal,
                profileAvatar: _profileAvatar,
                profileImage: _profileImage,
              ),
            if (!_isLogin)
              const SizedBox(
                height: 20,
              ),
            if (!_isLogin)
              const RegisterFormInput(
                label: "Username",
              ),
            if (!_isLogin)
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
            RegisterFormButton(
              label: _isLogin ? "Login" : "Create Account",
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterFormSwitcher(
              onSwitchFrom: _switchForm,
              label: _isLogin ? "Create Account?" : "Login Instead?",
              icon: _isLogin ? Icons.cloud_outlined : Icons.cloud,
            ),
          ],
        ),
      ),
    );
  }
}
