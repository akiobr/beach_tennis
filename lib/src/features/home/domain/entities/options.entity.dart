import '../enums/sort_type.enum.dart';
import 'colored_panel.entity.dart';

class OptionsEntity {
  static const Duration _defaultDuration = Duration(seconds: 2);

  List<ColoredPanelEntity> panels;
  SortType sortType;
  final Duration defaultDuration;

  OptionsEntity({
    required this.panels,
    required this.sortType,
    this.defaultDuration = _defaultDuration,
  });

  OptionsEntity copyWith({
    List<ColoredPanelEntity>? panels,
    SortType? sortType,
    Duration? defaultDuration,
  }) {
    return OptionsEntity(
      panels: panels ?? this.panels,
      sortType: sortType ?? this.sortType,
      defaultDuration: defaultDuration ?? this.defaultDuration,
    );
  }
}
