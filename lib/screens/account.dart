import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../database/account_manager.dart';

import '../models/account_model.dart';

import '../widgets/common/avatars_modal.dart';
import '../widgets/common/loading_indicator.dart';
import '../widgets/common/warning_snack_bar.dart';
import '../widgets/common/labelled_divider.dart';

import '../widgets/account/account_profile.dart';
import '../widgets/account/account_input.dart';
import '../widgets/account/account_save.dart';
import '../widgets/account/account_reset.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    required this.updateAccount,
    required this.account,
    super.key,
  });

  final Future<void> Function() updateAccount;
  final AccountModel account;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isProfileChanged = false;
  bool _isUsernameChanged = false;
  bool _isLocationChanged = false;
  String? _profileAvatar;
  String? _profileImage;
  String? _oldPassword;
  String? _password;
  String? _location;
  String? _username;

  @override
  void initState() {
    super.initState();

    if (widget.account.profile.contains("./lib/images/register/avatars/")) {
      _profileAvatar = widget.account.profile;
      return;
    }

    _profileImage = widget.account.profile;
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_password!.isEmpty && _oldPassword!.isNotEmpty) {
      _showWarningSnackBar(
        message: "ENTER THE NEW PASSWORD",
        icon: Icons.error_outline,
      );

      return;
    }

    if (_password!.isNotEmpty && _oldPassword!.isEmpty) {
      _showWarningSnackBar(
        message: "ENTER THE OLD PASSWORD",
        icon: Icons.error_outline,
      );

      return;
    }

    loadingIndicator(
      context: context,
    );

    if (_password!.isNotEmpty && _oldPassword!.isNotEmpty) {
      final isSuccessful = await accountManager.updatePassword(
        currentEmail: widget.account.email,
        currentPassword: _oldPassword!,
        newPassword: _password!,
      );

      if (!isSuccessful) {
        _showWarningSnackBar(
          message: "OLD PASSWORD IS INCORRECT",
          icon: Icons.error_outline,
        );

        _closeLoadingIndicator();
        return;
      }
    }

    if (_isProfileChanged) {
      await accountManager.updateProfile(
        profileAvatar: _profileAvatar,
        profileImage: _profileImage,
      );
    }

    if (_isLocationChanged) {
      await accountManager.updateLocation(
        location: _location!,
      );
    }

    if (_isUsernameChanged) {
      await accountManager.updateUsername(
        username: _username!,
      );
    }

    await widget.updateAccount();

    _closeLoadingIndicator();
    _closeLoadingIndicator();
  }

  String? _validateLocation(String? location) {
    if (location == null || location.isEmpty) {
      _isLocationChanged = false;
      return null;
    }

    if (location.length < 4) {
      _isLocationChanged = false;
      return "Invalid Username";
    }

    _isLocationChanged = true;
    return null;
  }

  String? _validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      _isUsernameChanged = false;
      return null;
    }

    if (username.length < 4 || username.length > 50) {
      _isUsernameChanged = false;
      return "Invalid Username";
    }

    _isUsernameChanged = true;
    return null;
  }

  String? _validateOldPassword(String? oldPassword) {
    if (oldPassword == null || oldPassword.isEmpty) return null;

    if (oldPassword.length < 6 || oldPassword.length > 20) {
      return "Invalid Password";
    }

    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) return null;

    if (password.length < 6 || password.length > 20) {
      return "Invalid Password";
    }

    return null;
  }

  void _saveLocation(String? location) {
    if (location == null) return;
    _location = location;
  }

  void _saveUsername(String? username) {
    if (username == null) return;
    _username = username;
  }

  void _saveOldPassword(String? oldPassword) {
    if (oldPassword == null) return;
    _oldPassword = oldPassword;
  }

  void _savePassword(String? password) {
    if (password == null) return;
    _password = password;
  }

  void _selectAvatar({required String selectedAvatar}) {
    Navigator.of(context).pop();

    setState(() {
      _profileAvatar = selectedAvatar;
      _profileImage = null;
    });

    if (widget.account.profile == selectedAvatar) {
      _isProfileChanged = false;
      return;
    }

    _isProfileChanged = true;
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
        return AvatarsModal(
          onSelectAvatar: _selectAvatar,
        );
      },
    );
  }

  Future<void> _openCamera() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      maxWidth: 200,
    );

    if (pickedImage == null) return;

    setState(() {
      _profileImage = pickedImage.path;
      _profileAvatar = null;
    });

    _isProfileChanged = true;
  }

  void _resetAccount() {
    if (widget.account.profile.contains("./lib/images/register/avatars/")) {
      setState(() {
        _profileAvatar = widget.account.profile;
        _profileImage = null;
      });
    } else {
      setState(() {
        _profileImage = widget.account.profile;
        _profileAvatar = null;
      });
    }

    _formKey.currentState!.reset();
    _isUsernameChanged = false;
    _isLocationChanged = false;
    _isProfileChanged = false;
  }

  void _showWarningSnackBar({
    required String message,
    required IconData icon,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      warningSnackBar(
        message: message,
        icon: icon,
      ),
    );
  }

  void _closeLoadingIndicator() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 20),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          iconSize: 30,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AccountProfile(
                onOpenAvatars: _openAvatarModal,
                onOpenCamera: _openCamera,
                profileAvatar: _profileAvatar,
                profileImage: _profileImage,
              ),
              const SizedBox(
                height: 25,
              ),
              AccountInput(
                validateInput: _validateLocation,
                saveInput: _saveLocation,
                label: widget.account.location,
                icon: Icons.place_outlined,
              ),
              const SizedBox(
                height: 15,
              ),
              AccountInput(
                validateInput: _validateUsername,
                saveInput: _saveUsername,
                label: widget.account.username,
                icon: Icons.face,
              ),
              const SizedBox(
                height: 30,
              ),
              const LabelledDivider(
                label: "REQUIRES AUTHENTICATION",
              ),
              const SizedBox(
                height: 25,
              ),
              AccountInput(
                validateInput: _validateOldPassword,
                saveInput: _saveOldPassword,
                icon: Icons.shield_outlined,
                label: "Old Password",
                isHidden: true,
              ),
              const SizedBox(
                height: 15,
              ),
              AccountInput(
                validateInput: _validatePassword,
                saveInput: _savePassword,
                icon: Icons.shield_outlined,
                label: "New Password",
                isHidden: true,
              ),
              const SizedBox(
                height: 20,
              ),
              AccountSave(
                onSubmit: _submitForm,
                label: "Save Details",
              ),
              const SizedBox(
                height: 20,
              ),
              AccountReset(
                icon: Icons.restart_alt_outlined,
                label: "Reset Defaults",
                onReset: _resetAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
