part of 'workouts_bloc.dart';

/// {@template workouts_state}
/// WorkoutsState description
/// {@endtemplate}
class WorkoutsState extends Equatable {
  /// {@macro workouts_state}
  const WorkoutsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current WorkoutsState with property changes
  WorkoutsState copyWith({
    String? customProperty,
  }) {
    return WorkoutsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}

/// {@template workouts_initial}
/// The initial state of WorkoutsState
/// {@endtemplate}
class WorkoutsInitial extends WorkoutsState {
  /// {@macro workouts_initial}
  const WorkoutsInitial() : super();
}
