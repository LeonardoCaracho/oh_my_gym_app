part of 'workouts_history_cubit.dart';

class WorkoutsHistoryState extends Equatable {
  const WorkoutsHistoryState({
    this.records = const [],
    this.status = Status.inital,
  });

  final List<WorkoutHistory> records;
  final Status status;

  @override
  List<Object> get props => [records, status];

  WorkoutsHistoryState copyWith({
    List<WorkoutHistory>? records,
    List<WorkoutHistory>? recordsGrouped,
    List<WorkoutHistory>? recordsByWorkout,
    Status? status,
  }) {
    return WorkoutsHistoryState(
      records: records ?? this.records,
      status: status ?? this.status,
    );
  }
}
