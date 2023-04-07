import 'package:flutter/material.dart';
import 'package:translator/ui/color.dart';

class TranslateButton extends StatelessWidget {
  final Function trans;
  const TranslateButton({super.key, required this.trans});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
      onPressed: () {
        trans();
      },
      child: const Text(
        "Translate",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
