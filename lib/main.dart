import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';

import './models/account_model.dart';

import './firebase_options.dart';

import './screens/account.dart';

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
    return const MaterialApp(
      home: AccountScreen(
        account: AccountModel(
          email: "ryan@gmail.com",
          username: "RyxnDmello",
          profile: "./lib/images/register/avatars/avatar-1.png",
          location: "Panaji",
        ),
      ),
    );
  }
}
