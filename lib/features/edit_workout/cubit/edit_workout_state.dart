part of 'edit_workout_cubit.dart';

/// {@template edit_workout}
/// EditWorkoutState description
/// {@endtemplate}
class EditWorkoutState extends Equatable {
  /// {@macro edit_workout}
  const EditWorkoutState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current EditWorkoutState with property changes
  EditWorkoutState copyWith({
    String? customProperty,
  }) {
    return EditWorkoutState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template edit_workout_initial}
/// The initial state of EditWorkoutState
/// {@endtemplate}
class EditWorkoutInitial extends EditWorkoutState {
  /// {@macro edit_workout_initial}
  const EditWorkoutInitial() : super();
}
