part of 'workouts_history_cubit.dart';

/// {@template workouts_history}
/// WorkoutsHistoryState description
/// {@endtemplate}
class WorkoutsHistoryState extends Equatable {
  /// {@macro workouts_history}
  const WorkoutsHistoryState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current WorkoutsHistoryState with property changes
  WorkoutsHistoryState copyWith({
    String? customProperty,
  }) {
    return WorkoutsHistoryState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template workouts_history_initial}
/// The initial state of WorkoutsHistoryState
/// {@endtemplate}
class WorkoutsHistoryInitial extends WorkoutsHistoryState {
  /// {@macro workouts_history_initial}
  const WorkoutsHistoryInitial() : super();
}
