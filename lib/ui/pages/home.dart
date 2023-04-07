import 'package:flutter/material.dart';
import 'package:translator/ui/widgets/clean_button.dart';
import 'package:translator/ui/widgets/copy_button.dart';
import 'package:translator/ui/widgets/input_box.dart';
import 'package:translator/ui/widgets/result_box.dart';
import 'package:translator/ui/widgets/trans_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedLanguage = 'English';
  // output and input
  String out = '';
  final TextEditingController _textController = TextEditingController();

  setOutValue(String newValue) {
    setState(() {
      out = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: InputBox(
                  textController: _textController,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ResultBox(
                    out: out,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: TransButton(
                      textController: _textController,
                      out: out,
                      setOutValue: setOutValue,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: CopyButton(text: out),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: CleanButton(
                      textController: _textController,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
