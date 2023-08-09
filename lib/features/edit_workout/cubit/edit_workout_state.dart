part of 'edit_workout_cubit.dart';

// class EditWorkoutState extends Equatable {
//   const EditWorkoutState();

//   @override
//   List<Object> get props => [];
// }

class EditWorkoutState extends Equatable {
  const EditWorkoutState({
    required this.workout,
    this.status = Status.inital,
  }) : super();

  final Status status;
  final Workout workout;

  @override
  List<Object> get props => [status, workout];

  EditWorkoutState copyWith({
    Status? status,
    Workout? workout,
  }) {
    return EditWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
    );
  }
}
