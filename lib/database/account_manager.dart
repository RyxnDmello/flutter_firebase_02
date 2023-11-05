import "package:firebase_auth/firebase_auth.dart";

class _AccountManager {
  _AccountManager() : _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Future<bool> createAccount({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }
}

final accountManager = _AccountManager();
