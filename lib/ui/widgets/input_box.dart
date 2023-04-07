import 'package:flutter/material.dart';
import 'package:translator/ui/color.dart';

class InputBox extends StatefulWidget {
  final TextEditingController textController;
  const InputBox({super.key, required this.textController});

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
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
      child: TextField(
        onChanged: (value) {
          setState(() {});
        },
        controller: widget.textController,
        minLines: 5,
        maxLines: 999,
        decoration: const InputDecoration(
          hintText: "Tap to enter text...",
          hintStyle: TextStyle(
            color: Color(0xFFB7A5A9),
            fontFamily: 'Roboto',
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}
