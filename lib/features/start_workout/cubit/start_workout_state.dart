part of 'start_workout_cubit.dart';

class StartWorkoutState extends Equatable {
  const StartWorkoutState({
    this.status = Status.inital,
    this.workout,
    this.exercises,
  });

  final Status status;
  final Workout? workout;
  final List<Exercise>? exercises;

  @override
  List<Object> get props => [status];

  StartWorkoutState copyWith({
    Status? status,
    Workout? workout,
    List<Exercise>? exercises,
  }) {
    return StartWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      exercises: exercises ?? this.exercises,
    );
  }
}
