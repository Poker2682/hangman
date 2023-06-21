import 'package:flutter/material.dart';
import 'package:hangman/game_screen.dart';
import 'package:hangman/letter/letter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const LetterScreen());
  }
}
