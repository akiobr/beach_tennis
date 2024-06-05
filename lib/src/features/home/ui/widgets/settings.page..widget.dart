import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.controller.dart';
import 'color_option.widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<HomeController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionWidget(
            title: 'Cores:',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Scrollbar(
                  trackVisibility: true,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    primary: true,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: controller.value.options.panels.map<ColorOption>((e) => ColorOption(panel: e)).toList(),
                      ),
                    ),
                  ),
                ),
                Center(child: IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.add))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionWidget extends StatelessWidget {
  const SectionWidget({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
        ),
        child,
        const Divider(),
      ],
    );
  }
}
