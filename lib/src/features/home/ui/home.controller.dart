import 'dart:math';

import 'package:flutter/material.dart';

import '../domain/entities/colored_panel.entity.dart';
import '../domain/entities/options.entity.dart';
import '../domain/enums/sort_type.enum.dart';
import 'home.state.dart';

class HomeController extends ValueNotifier<HomeState> {
  HomeController()
      : super(InitialHomeState(
          options: OptionsEntity(panels: _defaultPanels, sortType: SortType.sequential),
          currentPanelIndex: 0,
          currentActionIcon: Icons.play_arrow,
        ));

  static const Duration _defaultDuration = Duration(seconds: 2);

  static final List<ColoredPanelEntity> _defaultPanels = [
    ColoredPanelEntity(color: Colors.red, duration: _defaultDuration),
    ColoredPanelEntity(color: Colors.blue, duration: _defaultDuration),
    ColoredPanelEntity(color: Colors.yellow, duration: _defaultDuration),
  ];

  bool isExecuting = false;

  setSortType(SortType sortType) {
    value = value.copyWith(options: value.options.copyWith(sortType: sortType));
  }

  addPanel() {
    List<ColoredPanelEntity> newList = List.from(value.options.panels);
    newList.add(ColoredPanelEntity(color: Colors.white, duration: _defaultDuration));
    value = value.copyWith(options: value.options.copyWith(panels: newList));
  }

  removePanel(ColoredPanelEntity panel) {
    List<ColoredPanelEntity> newList = List.from(value.options.panels)..remove(panel);
    if (newList.isEmpty) {
      newList.add(ColoredPanelEntity(color: Colors.white, duration: _defaultDuration));
    }
    value = value.copyWith(options: value.options.copyWith(panels: newList));
  }

  notify() {
    notifyListeners();
  }

  startStopAction() {
    if (isExecuting) {
      stop();
    } else {
      start();
    }
  }

  stop() {
    isExecuting = false;
    value = (value as InitialHomeState).copyWith(currentActionIcon: Icons.play_arrow);
  }

  start() async {
    isExecuting = true;
    value = (value as InitialHomeState).copyWith(currentActionIcon: Icons.pause);
    while (isExecuting) {
      await Future.delayed(value.currentPanel.duration);
      if (value.options.sortType == SortType.sequential) {
        nextSequential();
      } else {
        nextRandom();
      }
    }
  }

  next(int index) {
    value = value.copyWith(currentPanelIndex: index);
  }

  nextRandom() {
    int nextValue = Random().nextInt(value.options.panels.length);
    while (nextValue == value.currentPanelIndex) {
      nextValue = Random().nextInt(value.options.panels.length);
    }
    next(nextValue);
  }

  nextSequential() {
    var maxValue = value.options.panels.length - 1;
    if (value.currentPanelIndex == maxValue) {
      next(0);
    } else {
      next(value.currentPanelIndex + 1);
    }
  }
}
