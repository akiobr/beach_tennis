import 'package:beach_tennis/src/features/home/domain/entities/options.entity.dart';
import 'package:flutter/material.dart';

import '../domain/entities/colored_panel.entity.dart';

abstract class HomeState {
  final OptionsEntity options;
  final int currentPanelIndex;

  ColoredPanelEntity get currentPanel => options.panels.elementAt(currentPanelIndex);

  HomeState({required this.options, required this.currentPanelIndex});

  HomeState copyWith({
    OptionsEntity? options,
    int? currentPanelIndex,
  });
}

class InitialHomeState extends HomeState {
  InitialHomeState({
    required super.options,
    required super.currentPanelIndex,
    required this.currentActionIcon,
  });

  final IconData currentActionIcon;

  @override
  HomeState copyWith({
    OptionsEntity? options,
    int? currentPanelIndex,
    IconData? currentActionIcon,
  }) {
    return InitialHomeState(
      options: options ?? this.options,
      currentPanelIndex: currentPanelIndex ?? this.currentPanelIndex,
      currentActionIcon: currentActionIcon ?? this.currentActionIcon,
    );
  }
}

class LoadingHomeState extends HomeState {
  LoadingHomeState({required super.options, required super.currentPanelIndex});

  @override
  HomeState copyWith({
    OptionsEntity? options,
    int? currentPanelIndex,
  }) {
    return LoadingHomeState(
      options: options ?? this.options,
      currentPanelIndex: currentPanelIndex ?? this.currentPanelIndex,
    );
  }
}

class ErrorHomeState extends HomeState {
  ErrorHomeState({required super.options, required super.currentPanelIndex});

  @override
  HomeState copyWith({
    OptionsEntity? options,
    int? currentPanelIndex,
  }) {
    return ErrorHomeState(
      options: options ?? this.options,
      currentPanelIndex: currentPanelIndex ?? this.currentPanelIndex,
    );
  }
}
