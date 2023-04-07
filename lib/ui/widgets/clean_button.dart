import 'package:flutter/material.dart';
import 'package:translator/ui/color.dart';

class CleanButton extends StatelessWidget {
  final TextEditingController textController;
  const CleanButton({super.key, required this.textController});

  void clean() {
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
      onPressed: () {
        clean();
      },
      child: const Text(
        "Clean",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
