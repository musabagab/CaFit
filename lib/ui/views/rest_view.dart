import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class RestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeAnimatedTextKit(
        totalRepeatCount: 1,
        pause: Duration(milliseconds: 1000),
        text: ["1", "2", "3", "4", "5"],
        onFinished: () {
          // go back
          Navigator.pop(context);
        },
        textStyle: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        displayFullTextOnTap: true,
        stopPauseOnTap: true);
  }
}
