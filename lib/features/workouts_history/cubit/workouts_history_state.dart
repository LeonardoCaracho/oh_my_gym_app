part of 'workouts_history_cubit.dart';

class WorkoutsHistoryState extends Equatable {
  const WorkoutsHistoryState({
    this.records = const [],
    this.recordsGrouped = const [],
    this.recordsByWorkout = const [],
    this.status = Status.inital,
  });

  final List<WorkoutHistory> records;
  final List<WorkoutHistory> recordsGrouped;
  final List<WorkoutHistory> recordsByWorkout;
  final Status status;

  @override
  List<Object> get props => [records, status, recordsGrouped, recordsByWorkout];

  WorkoutsHistoryState copyWith({
    List<WorkoutHistory>? records,
    List<WorkoutHistory>? recordsGrouped,
    List<WorkoutHistory>? recordsByWorkout,
    Status? status,
  }) {
    return WorkoutsHistoryState(
      records: records ?? this.records,
      status: status ?? this.status,
      recordsGrouped: recordsGrouped ?? this.recordsGrouped,
      recordsByWorkout: recordsByWorkout ?? this.recordsByWorkout,
    );
  }
}
