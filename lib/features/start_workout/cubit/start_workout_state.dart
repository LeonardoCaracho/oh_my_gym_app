part of 'start_workout_cubit.dart';

class StartWorkoutState extends Equatable {
  const StartWorkoutState({
    this.status = Status.inital,
    this.workout,
  });

  final Status status;
  final Workout? workout;

  @override
  List<Object> get props => [status];

  StartWorkoutState copyWith({
    Status? status,
    Workout? workout,
  }) {
    return StartWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
    );
  }
}
