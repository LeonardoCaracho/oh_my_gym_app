part of 'settings_cubit.dart';

/// {@template settings}
/// SettingsState description
/// {@endtemplate}
class SettingsState extends Equatable {
  /// {@macro settings}
  const SettingsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current SettingsState with property changes
  SettingsState copyWith({
    String? customProperty,
  }) {
    return SettingsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template settings_initial}
/// The initial state of SettingsState
/// {@endtemplate}
class SettingsInitial extends SettingsState {
  /// {@macro settings_initial}
  const SettingsInitial() : super();
}
