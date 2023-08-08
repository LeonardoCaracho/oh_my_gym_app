part of 'edit_workout_cubit.dart';

class EditWorkoutState extends Equatable {
  const EditWorkoutState({
    this.status = Status.inital,
    this.workoutName = '',
    this.exercises = const [],
    this.timestamp = 0,
    this.id = '',
  });

  final Status status;

  final String workoutName;
  final List<Exercise> exercises;
  final String id;
  final int timestamp;

  @override
  List<Object> get props => [status, workoutName, exercises, timestamp, id];

  EditWorkoutState copyWith({
    Status? status,
    String? workoutName,
    List<Exercise>? exercises,
    int? timestamp,
    String? id,
  }) {
    return EditWorkoutState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      workoutName: workoutName ?? this.workoutName,
      timestamp: timestamp ?? this.timestamp,
      id: id ?? this.id,
    );
  }
}
