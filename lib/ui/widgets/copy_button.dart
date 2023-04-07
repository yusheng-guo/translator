import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/ui/color.dart';

class CopyButton extends StatelessWidget {
  final String text;

  const CopyButton({Key? key, required this.text}) : super(key: key);

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
      ),
      child: const Text(
        "Copy",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
        ),
      ),
      onPressed: () => _copyToClipboard(context),
    );
  }
}
