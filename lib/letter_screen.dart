import 'package:flutter/material.dart';

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        children: [
          Expanded(flex: 2, child: Image.asset("assets/love-img-1.png")),
          const Expanded(
              child: Text(
                  style: TextStyle(fontSize: 28, color: Colors.black87),
                  "Worka bonito")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                maximumSize: const Size(200, 50),
                backgroundColor: Colors.red),
            child: const Text("Siguiente"),
            onPressed: () => {},
          ),
          const SizedBox(
            height: 50,
          )
        ],
      )),
    );
  }
}
