import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/colored_panel.entity.dart';
import '../home.controller.dart';

class ColorOption extends StatelessWidget {
  ColorOption({super.key, required this.panel}) {
    textController = TextEditingController(text: panel.duration.inSeconds.toString());
  }

  final ColoredPanelEntity panel;
  late TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Card(
        shape: context.read<HomeController>().value.currentPanel == panel
            ? RoundedRectangleBorder(
                side: const BorderSide(color: Colors.cyan, width: 3),
                borderRadius: BorderRadius.circular(10),
              )
            : null,
        color: panel.color,
        child: Column(
          children: [
            const Text('Tempo'),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (panel.duration.inSeconds > 1) {
                      panel.duration = Duration(seconds: panel.duration.inSeconds - 1);
                      textController.text = panel.duration.inSeconds.toString();
                    }
                  },
                  icon: const Icon(Icons.remove, size: 16),
                ),
                Expanded(
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: textController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (panel.duration.inSeconds < 999) {
                      panel.duration = Duration(seconds: panel.duration.inSeconds + 1);
                      textController.text = panel.duration.inSeconds.toString();
                    }
                  },
                  icon: const Icon(Icons.add, size: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    Color pickerColor = panel.color;
                    Color? newColor = await showDialog(
                      builder: (context) => AlertDialog(
                        title: const Text('Selecione a cor'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: panel.color,
                            enableAlpha: false,
                            onColorChanged: (color) => pickerColor = color,
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Gravar'),
                            onPressed: () {
                              Navigator.of(context).pop(pickerColor);
                            },
                          ),
                        ],
                      ),
                      context: context,
                    );
                    if (newColor != null) {
                      panel.color = newColor;
                      context.read<HomeController>().notify();
                    }
                  },
                  icon: const Icon(Icons.edit, size: 20),
                ),
                IconButton(
                  onPressed: context.read<HomeController>().value.currentPanel == panel ? null : () => context.read<HomeController>().removePanel(panel),
                  icon: const Icon(Icons.delete, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
