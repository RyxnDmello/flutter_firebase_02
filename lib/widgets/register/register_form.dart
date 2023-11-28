import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../database/account_manager.dart';

import './form/register_form_title.dart';
import './form/register_form_profile.dart';
import './form/register_form_avatar_modal.dart';
import './form/register_form_input.dart';
import './form/register_form_button.dart';
import './form/register_form_switcher.dart';
import './form/register_form_warning.dart';

import '../../screens/splash.dart';

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
  String? _username;
  String? _email;
  String? _password;

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_isLogin && _profileImage == null && _profileAvatar == null) {
      _warningMessage(
        message: "PROFILE IMAGE NOT SET",
        icon: Icons.face,
      );

      return;
    }

    _formKey.currentState!.save();
    _showLoadingIndicator();

    if (_isLogin) {
      final isLogged = await accountManager.loginAccount(
        email: _email!,
        password: _password!,
      );

      if (!isLogged) {
        _warningMessage(
          message: "FAILED TO LOGIN",
          icon: Icons.error_outline,
        );

        return;
      }

      _navigateToSplash();

      return;
    }

    final isCreated = await accountManager.createAccount(
      profileImage: _profileImage,
      profileAvatar: _profileAvatar,
      username: _username!,
      email: _email!,
      password: _password!,
    );

    if (!isCreated) {
      _warningMessage(
        message: "FAILED TO CREATE ACCOUNT",
        icon: Icons.error_outline,
      );

      return;
    }

    _navigateToSplash();
  }

  String? _validateUsername(String? username) {
    if (username == null || username.length < 4 || username.length > 50) {
      return "Invalid Username";
    }

    return null;
  }

  String? _validateEmail(String? email) {
    if (email == null ||
        !email.contains("@gmail.com") &&
            !email.contains("@outlook.com") &&
            !email.contains("@hotmail.com")) {
      return "Invalid Email Address";
    }

    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.length < 6 || password.length > 20) {
      return "Invalid Password";
    }

    return null;
  }

  void _saveUsername(String? username) {
    if (username == null) return;
    _username = username;
  }

  void _saveEmail(String? email) {
    if (email == null) return;
    _email = email;
  }

  void _savePassword(String? password) {
    if (password == null) return;
    _password = password;
  }

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

  void _selectAvatar(String selectedAvatar) {
    Navigator.of(context).pop();

    setState(() {
      _profileAvatar = selectedAvatar;
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

  void _navigateToSplash() {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => SplashScreen(
          isLogin: _isLogin,
        ),
      ),
    );
  }

  void _warningMessage({required String message, required IconData icon}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      registerFormWarning(
        message: message,
        icon: icon,
      ),
    );

    if (icon.codePoint == Icons.face.codePoint) return;
    Navigator.of(context).pop();
  }

  void _showLoadingIndicator() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 0, 50, 255),
            backgroundColor: Colors.black26,
          ),
        );
      },
    );
  }

  void _switchForm() {
    setState(() => _isLogin = !_isLogin);
    _formKey.currentState!.reset();
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
              RegisterFormInput(
                onValidate: _validateUsername,
                onSave: _saveUsername,
                label: "Username",
              ),
            if (!_isLogin)
              const SizedBox(
                height: 16.5,
              ),
            RegisterFormInput(
              onValidate: _validateEmail,
              onSave: _saveEmail,
              label: "Email Address",
            ),
            const SizedBox(
              height: 16.5,
            ),
            RegisterFormInput(
              onValidate: _validatePassword,
              onSave: _savePassword,
              label: "Password",
              isPassword: true,
            ),
            const SizedBox(
              height: 20,
            ),
            RegisterFormButton(
              onSubmitForm: _submitForm,
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
