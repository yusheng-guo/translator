import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:translator/service/translate_text.dart';
import 'package:translator/ui/color.dart';

class TransButton extends StatefulWidget {
  final TextEditingController textController;
  final String out;
  final Function setOutValue;
  const TransButton(
      {super.key,
      required this.textController,
      required this.out,
      required this.setOutValue});

  @override
  State<TransButton> createState() => _TransButtonState();
}

class _TransButtonState extends State<TransButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
      onPressed: () {
        EasyLoading.show(status: '加载中...');
        translate(widget.textController.text).then(
          (value) {
            EasyLoading.dismiss();
            // 处理结果
            widget.setOutValue(value);
          },
        );
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
