import 'package:flutter/material.dart';

class ColoredPanel extends StatelessWidget {
  const ColoredPanel({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color);
  }
}
