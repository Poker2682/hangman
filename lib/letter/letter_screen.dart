import 'package:flutter/material.dart';
import 'package:hangman/consts/consts.dart';

class LetterScreen extends StatelessWidget {
  static const List images = [
    "1.png",
    "2.png",
    "3.png",
    "4.png",
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
                  color: index == 0
                      ? AppColors.letterBgColor1
                      : AppColors.letterBgColor2,
                  image: DecorationImage(
                    image: AssetImage("assets/letter/${images[index]}"),
                  )),
            );
          }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: Center(
  //         child: Column(
  //       children: [
  //         Expanded(flex: 2, child: Image.asset("assets/love-img-1.png")),
  //         const Expanded(
  //             child: Text(
  //                 style: TextStyle(fontSize: 28, color: Colors.black87),
  //                 "Worka bonito")),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //               minimumSize: const Size(200, 50),
  //               maximumSize: const Size(200, 50),
  //               backgroundColor: Colors.red),
  //           child: const Text("Siguiente"),
  //           onPressed: () => {},
  //         ),
  //         const SizedBox(
  //           height: 50,
  //         )
  //       ],
  //     )),
  //   );
  // }
}
