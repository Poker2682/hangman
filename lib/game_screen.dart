import 'package:flutter/material.dart';
import 'package:hangman/alert.dart';
import 'package:hangman/consts/consts.dart';
import 'package:hangman/game/figure_widget.dart';
import 'package:hangman/game/hidden_letter.dart';
import 'package:hangman/letter/letter_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnñopqrstuvwxyz".toUpperCase();
  List<String> selectedChar = [];
  List<String> wordList = ["PALABRA", "CAJA", "PAPEL", "SAPO"];
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

    if (wordIsComplete()) {
      var currentWordIndex = wordList.indexOf(currentWord);
      var remainingWords = wordList.length - currentWordIndex - 1;

      if (remainingWords != 0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Alert("Lo conseguiste",
                  "Te quedan $remainingWords palabras por encontrar", () {
                Navigator.of(context).pop();
              });
            });

        setState(() {
          selectedChar.clear();
          tries = 0;
          currentWord = wordList[currentWordIndex + 1];
        });
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Alert(
                  "¡Felicidades!", "Has completado el juego, aqui va tu premio",
                  () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const LetterScreen())));
              });
            });
        setState(() {
          selectedChar.clear();
          currentWord = wordList.first;
        });
      }
    }
  }

  bool wordIsComplete() {
    for (var char in currentWord.split("")) {
      if (!selectedChar.contains(char)) {
        return false;
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    currentWord = wordList.first.toUpperCase();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alert(
                "Hola mi amor :)",
                "Necesitaba estudiar para la tesis, y tambien queria hacerte una "
                    "carta que te sorprendiera al mismo tiempo, asi que programe este "
                    "jueguito del ahorcado que deberas resolver para descubrir tu carta.\n\n"
                    "Te amo! \u2665", () {
              Navigator.of(context).pop();
            });
          });
    });
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
