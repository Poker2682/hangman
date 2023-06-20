import 'package:flutter/material.dart';
import 'package:hangman/alert.dart';
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
  List<String> selectedChar = [];
  List<String> wordList = ["palabra", "caja", "papel", "sapo"];
  String currentWord = "";

  var tries = 0;

  void onCharPressed(String char) {
    setState(() {
      selectedChar.add(char.toUpperCase());
      if (!currentWord.split("").contains(char.toUpperCase())) {
        tries++;
      }
    });

    if (tries == 6) {
      setState(() {
        tries = 0;
        selectedChar.clear();
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert("Perdiste", "Intenta de nuevo", () {
              Navigator.of(context).pop();
            });
          });
    }
  }

  @override
  void initState() {
    super.initState();
    currentWord = wordList.first.toUpperCase();
  }

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
                          children: currentWord
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
                                  : () => onCharPressed(e),
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
