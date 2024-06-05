import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.controller.dart';
import 'home.state.dart';
import 'widgets/colored_container.widget.dart';
import 'widgets/settings.page..widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
      valueListenable: context.read<HomeController>(),
      builder: (context, value, child) {
        switch (value) {
          case InitialHomeState _:
            return HomeDefaultBody(value);
          default:
            return Container();
        }
      },
    );
  }
}

class HomeDefaultBody extends StatelessWidget {
  const HomeDefaultBody(this.state, {super.key});

  final InitialHomeState state;

  @override
  Widget build(BuildContext context) {
    double minDrawerWidth = 200;
    double recommendedDrawerWidth = MediaQuery.of(context).size.width * .4;
    return Scaffold(
      drawer: Drawer(
        width: recommendedDrawerWidth < minDrawerWidth ? minDrawerWidth : recommendedDrawerWidth,
        child: const SettingsPage(),
      ),
      backgroundColor: Colors.black,
      body: ColoredContainer(state.currentPanel),
      floatingActionButton: Builder(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: context.read<HomeController>().startStopAction,
              child: Icon(state.currentActionIcon),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              onPressed: Scaffold.of(context).openDrawer,
              child: const Icon(Icons.settings),
            ),
          ],
        );
      }),
    );
  }
}
