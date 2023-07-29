import 'package:flutter/material.dart';
import 'package:roqqu_levels/screens/home_screen.dart';

void main() {
  runApp(const RoqquLevels());
}


class RoqquLevels extends StatelessWidget {
  const RoqquLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Satoshi'
      ),
    );
  }
}


