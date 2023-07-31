part of 'add_workout_cubit.dart';

class AddWorkoutState extends Equatable {
  const AddWorkoutState({
    this.status = Status.inital,
    this.workoutName = '',
    this.exercises = const [],
    this.timestamp = 0,
  });

  final Status status;

  final String workoutName;
  final List<Exercise> exercises;
  final int timestamp;

  @override
  List<Object> get props => [status, workoutName, exercises, timestamp];

  AddWorkoutState copyWith({
    Status? status,
    String? workoutName,
    List<Exercise>? exercises,
    int? timestamp,
  }) {
    return AddWorkoutState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      workoutName: workoutName ?? this.workoutName,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
