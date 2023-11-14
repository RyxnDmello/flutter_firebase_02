import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/weekly/weekly_day.dart';

class WeeklyScreen extends StatelessWidget {
  const WeeklyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 20),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 20),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const FaIcon(
            FontAwesomeIcons.solidHeart,
            color: Colors.white,
          ),
          splashRadius: 25,
        ),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeeklyDay(),
            SizedBox(
              height: 10,
            ),
            WeeklyDay(),
            SizedBox(
              height: 10,
            ),
            WeeklyDay(),
          ],
        ),
      ),
    );
  }
}
