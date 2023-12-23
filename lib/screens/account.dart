import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/account_model.dart';

import '../widgets/common/avatars_modal.dart';

import '../widgets/account/account_profile.dart';
import '../widgets/account/account_input.dart';
import '../widgets/account/account_save.dart';
import '../widgets/account/account_reset.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    required this.account,
    super.key,
  });

  final AccountModel account;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isProfileChanged = false;
  bool _isUsernameChanged = false;
  bool _isEmailChanged = false;
  bool _isPasswordChanged = false;
  bool _isLocationChanged = false;
  String? _profileAvatar;
  String? _profileImage;
  String? _username;
  String? _email;
  String? _password;
  String? _location;

  @override
  void initState() {
    super.initState();

    if (widget.account.profile.contains("./lib/images/register/avatars/")) {
      _profileAvatar = widget.account.profile;
      return;
    }

    _profileImage = widget.account.profile;
  }

  void _selectAvatar({required String selectedAvatar}) {
    Navigator.of(context).pop();

    setState(() {
      _profileAvatar = selectedAvatar;
      _profileImage = null;
      _isProfileChanged = true;
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
      _isProfileChanged = true;
    });
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
    _isPasswordChanged = false;
    _isLocationChanged = false;
    _isProfileChanged = false;
    _isEmailChanged = false;
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
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
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
                label: widget.account.location,
                icon: Icons.place_outlined,
              ),
              const SizedBox(
                height: 15,
              ),
              AccountInput(
                label: widget.account.username,
                icon: Icons.face,
              ),
              const SizedBox(
                height: 15,
              ),
              AccountInput(
                label: widget.account.email,
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 15,
              ),
              const AccountInput(
                icon: Icons.shield_outlined,
                isHidden: true,
                label: "••••••",
              ),
              const SizedBox(
                height: 20,
              ),
              const AccountSave(
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
