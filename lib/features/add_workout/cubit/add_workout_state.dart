part of 'add_workout_cubit.dart';

class AddWorkoutState extends Equatable {
  const AddWorkoutState({
    this.status = Status.inital,
    this.workoutName = '',
    this.exercises = const [],
  });

  final Status status;

  final String workoutName;
  final List<Exercise> exercises;

  @override
  List<Object> get props => [status, workoutName, exercises];

  AddWorkoutState copyWith({
    Status? status,
    String? workoutName,
    List<Exercise>? exercises,
  }) {
    return AddWorkoutState(
      status: status ?? this.status,
      exercises: exercises ?? this.exercises,
      workoutName: workoutName ?? this.workoutName,
    );
  }
}
