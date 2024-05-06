part of 'edit_workout_cubit.dart';

class EditWorkoutState extends Equatable {
  const EditWorkoutState({
    required this.workout,
    this.status = Status.inital,
    this.isEditMode = false,
    this.exercises = const [],
  }) : super();

  final Status status;
  final Workout workout;
  final bool isEditMode;
  final List<Exercise> exercises;

  @override
  List<Object> get props => [status, workout, isEditMode, exercises];

  EditWorkoutState copyWith({
    Status? status,
    Workout? workout,
    List<Exercise>? exercises,
  }) {
    return EditWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      isEditMode: isEditMode,
      exercises: exercises ?? this.exercises,
    );
  }
}
