import 'package:flutter/material.dart';
import 'package:hangman/consts/consts.dart';

class LetterScreen extends StatelessWidget {
  static const List images = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
    "5.png",
  ];

  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              decoration: BoxDecoration(
                  color: index < 1 || index > images.length - 2
                      ? AppColors.letterBgColor1
                      : AppColors.letterBgColor2,
                  image: DecorationImage(
                    image: AssetImage("assets/letter/${images[index]}"),
                  )),
            );
          }),
    );
  }
}
