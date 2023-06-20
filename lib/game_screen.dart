import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangman/consts/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letter.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnñopqrstuvwxyz".toUpperCase();
  var word = "baaba".toUpperCase();
  List<String> selectedChar = [];
  var tries = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("El ahorcado"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Stack(children: [
                            figure(GameUI.hang, tries >= 0),
                            figure(GameUI.head, tries >= 1),
                            figure(GameUI.body, tries >= 2),
                            figure(GameUI.leftArm, tries >= 3),
                            figure(GameUI.rightArm, tries >= 4),
                            figure(GameUI.leftLeg, tries >= 5),
                            figure(GameUI.rightLeg, tries >= 6),
                          ])),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: word
                              .split("")
                              .map((e) => hiddenLetter(
                                  e, selectedChar.contains(e.toUpperCase())))
                              .toList(),
                        ),
                      ))
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 7,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      children: characters
                          .split("")
                          .map((e) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black54),
                              onPressed: selectedChar.contains(e.toUpperCase())
                                  ? null
                                  : () {
                                      setState(() {
                                        selectedChar.add(e.toUpperCase());
                                        if (!word
                                            .split("")
                                            .contains(e.toUpperCase())) {
                                          tries++;
                                        }
                                      });
                                    },
                              child: Text(
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                  e)))
                          .toList(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
