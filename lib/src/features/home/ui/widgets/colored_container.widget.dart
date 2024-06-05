import 'package:flutter/material.dart';

import '../../domain/entities/colored_panel.entity.dart';
import 'colored_panel.widget.dart';

class ColoredContainer extends StatelessWidget {
  const ColoredContainer(this.panel, {super.key});

  final ColoredPanelEntity panel;

  @override
  Widget build(BuildContext context) {
    return ColoredPanel(color: panel.color);
  }
}
