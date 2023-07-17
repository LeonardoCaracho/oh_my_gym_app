part of 'add_workout_cubit.dart';

/// {@template add_workout}
/// AddWorkoutState description
/// {@endtemplate}
class AddWorkoutState extends Equatable {
  /// {@macro add_workout}
  const AddWorkoutState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddWorkoutState with property changes
  AddWorkoutState copyWith({
    String? customProperty,
  }) {
    return AddWorkoutState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template add_workout_initial}
/// The initial state of AddWorkoutState
/// {@endtemplate}
class AddWorkoutInitial extends AddWorkoutState {
  /// {@macro add_workout_initial}
  const AddWorkoutInitial() : super();
}
