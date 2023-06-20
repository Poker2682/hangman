import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hangman/consts/consts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  var characters = "abcdefghijklmnñopqrstuvwxyz".toUpperCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("El ahorcado"),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.amber,
                      )),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(8.0),
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
                          onPressed: () {},
                          child: Text(
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                              e)))
                      .toList(),
                ),
              )),
        ],
      ),
    );
  }
}
