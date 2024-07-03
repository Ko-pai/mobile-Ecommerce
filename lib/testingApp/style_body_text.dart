import 'package:flutter/material.dart';

class StyleBodyText extends StatelessWidget {
  const StyleBodyText(this.text, this.color, {super.key});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
