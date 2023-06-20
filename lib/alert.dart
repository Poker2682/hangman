import 'package:flutter/material.dart';
import 'package:hangman/consts/consts.dart';

class Alert extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onPressed;

  const Alert(this.title, this.message, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.bgColor),
            onPressed: onPressed,
            child: const Text("Aceptar"))
      ],
    );
  }
}
