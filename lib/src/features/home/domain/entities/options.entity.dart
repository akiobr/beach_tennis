import 'colored_panel.entity.dart';

class OptionsEntity {
  static const Duration _defaultDuration = Duration(seconds: 2);

  List<ColoredPanelEntity> panels;
  final Duration defaultDuration;

  OptionsEntity({
    required this.panels,
    this.defaultDuration = _defaultDuration,
  });

  OptionsEntity copyWith({
    List<ColoredPanelEntity>? panels,
    Duration? defaultDuration,
  }) {
    return OptionsEntity(
      panels: panels ?? this.panels,
      defaultDuration: defaultDuration ?? this.defaultDuration,
    );
  }
}
