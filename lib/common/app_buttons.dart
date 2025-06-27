import 'package:flutter/material.dart';

class AppButtons extends StatelessWidget {
  const AppButtons({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color.fromARGB(255, 0, 119, 119),
    this.textColor = Colors.white,
    this.size = 48,
    this.fontSize = 14,
  });

  final String text;
  final void Function() onPressed;
  final Color? color;
  final Color? textColor;
  final double size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: textColor == const Color.fromARGB(255, 0, 119, 119)
              ? const BorderSide(color: Color.fromRGBO(0, 146, 149, 1))
              : BorderSide(color: color!),
        ),
        minimumSize: Size(double.infinity, size),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: textColor),
      ),
    );
  }
}
