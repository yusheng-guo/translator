import 'package:flutter/material.dart';
import 'package:translator/ui/color.dart';

class ResultBox extends StatelessWidget {
  final String out;
  const ResultBox({super.key, required this.out});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: primaryColor,
          width: 2,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SelectableText(
          out,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
          showCursor: true,
          cursorColor: Colors.white,
          minLines: 5,
          maxLines: 999,
          scrollPhysics: const ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
