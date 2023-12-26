import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';

import './database/account_manager.dart';

import './firebase_options.dart';

import './screens/register.dart';
import './screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: accountManager.firebaseAuthInstance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return const RegisterScreen();
          }

          accountManager.initializeFirebase();

          return const SplashScreen(
            isLogin: false,
          );
        },
      ),
    );
  }
}
