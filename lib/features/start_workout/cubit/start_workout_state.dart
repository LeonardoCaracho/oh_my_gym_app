part of 'start_workout_cubit.dart';

/// {@template start_workout}
/// StartWorkoutState description
/// {@endtemplate}
class StartWorkoutState extends Equatable {
  /// {@macro start_workout}
  const StartWorkoutState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current StartWorkoutState with property changes
  StartWorkoutState copyWith({
    String? customProperty,
  }) {
    return StartWorkoutState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template start_workout_initial}
/// The initial state of StartWorkoutState
/// {@endtemplate}
class StartWorkoutInitial extends StartWorkoutState {
  /// {@macro start_workout_initial}
  const StartWorkoutInitial() : super();
}
