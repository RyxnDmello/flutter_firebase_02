import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/account_model.dart';

class _AccountManager {
  _AccountManager()
      : _firebaseAuth = FirebaseAuth.instance,
        _firebaseStorage = FirebaseStorage.instance,
        _firestore = FirebaseFirestore.instance,
        _userCredential = null,
        _profile = null,
        _account = null;

  final FirebaseAuth _firebaseAuth;
  final FirebaseStorage _firebaseStorage;
  final FirebaseFirestore _firestore;
  UserCredential? _userCredential;
  DocumentReference? _account;
  Reference? _profile;

  FirebaseAuth get firebaseAuthInstance {
    return _firebaseAuth;
  }

  DocumentReference? get firestoreAccount {
    return _account;
  }

  void initializeFirebase() {
    _account = _firestore.collection("accounts").doc(
          _firebaseAuth.currentUser!.uid,
        );

    _profile = _firebaseStorage.ref().child("accounts").child(
          "${_firebaseAuth.currentUser!.uid}.jpg",
        );
  }

  Future<bool> createAccount({
    required File? profileImage,
    required String? profileAvatar,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      _userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _account = _firestore.collection("accounts").doc(
            _userCredential!.user!.uid,
          );

      _profile = _firebaseStorage.ref().child("accounts").child(
            "${_userCredential!.user!.uid}.jpg",
          );

      if (profileAvatar != null) {
        await _account!.set(
          {
            "profile": profileAvatar,
            "username": username,
            "email": email,
          },
        );

        return true;
      }

      await _profile!.putFile(profileImage!);

      await _account!.set(
        {
          "profile": await _profile!.getDownloadURL(),
          "username": username,
          "email": email,
        },
      );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }

  Future<bool> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      _userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _account = _firestore.collection("accounts").doc(
            _userCredential!.user!.uid,
          );

      _profile = _firebaseStorage.ref().child("accounts").child(
            "${_userCredential!.user!.uid}.jpg",
          );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }

  Future<AccountModel?> account() async {
    final accountDoc = await _account!.get().then(
          (doc) => doc.data() as Map,
        );

    if (accountDoc["location"] == null) return null;

    return AccountModel(
      email: accountDoc["email"],
      username: accountDoc["username"],
      profile: accountDoc["profile"],
      location: accountDoc["location"],
    );
  }

  Future<void> updateProfile({
    required String? profileAvatar,
    required String? profileImage,
  }) async {
    if (profileAvatar != null) {
      await _account!.update(
        {
          "profile": profileAvatar,
        },
      );

      return;
    }

    await _profile!.putFile(
      File(profileImage!),
    );

    await _account!.update(
      {
        "profile": await _profile!.getDownloadURL(),
      },
    );
  }

  Future<void> updateLocation({required String location}) async {
    await _account!.update(
      {
        "location": location,
      },
    );
  }

  Future<void> updateUsername({required String username}) async {
    await _account!.update(
      {
        "username": username,
      },
    );
  }

  Future<bool> updatePassword({
    required String currentEmail,
    required String currentPassword,
    required String newPassword,
  }) async {
    final authCredential = EmailAuthProvider.credential(
      email: currentEmail,
      password: currentPassword,
    );

    try {
      _userCredential =
          await _userCredential!.user!.reauthenticateWithCredential(
        authCredential,
      );

      await _userCredential!.user!.updatePassword(newPassword);
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final accountManager = _AccountManager();
