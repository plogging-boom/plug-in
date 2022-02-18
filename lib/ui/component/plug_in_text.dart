import 'package:flutter/material.dart';

class PlugInText extends StatelessWidget {
  final String text;
  final Color color;
  final double? fontSize;
  final FontWeight fontWeight;

  const PlugInText(this.text,
      {Key? key,
      this.color = Colors.black,
      this.fontSize = 20.0,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: TextDecoration.none,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
