import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/account_model.dart';

import '../widgets/common/avatars_modal.dart';

import '../widgets/account/account_profile.dart';

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
  String? _profileAvatar;
  File? _profileImage;

  @override
  void initState() {
    super.initState();

    if (widget.account.profile.contains("./lib/images/register/avatars/")) {
      _profileAvatar = widget.account.profile;
      return;
    }

    _profileImage = File(
      widget.account.profile,
    );
  }

  void _selectAvatar({required String selectedAvatar}) {
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
      _profileImage = File(pickedImage.path);
      _profileAvatar = null;
    });
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
          horizontal: 15,
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
            ],
          ),
        ),
      ),
    );
  }
}
