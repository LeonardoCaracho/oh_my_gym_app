part of 'edit_workout_cubit.dart';

class EditWorkoutState extends Equatable {
  const EditWorkoutState({
    required this.workout,
    this.status = Status.inital,
    this.isEditMode = false,
    this.hasChanges = false,
    this.exercises = const [],
  }) : super();

  final Status status;
  final Workout workout;
  final bool isEditMode;
  final bool hasChanges;
  final List<Exercise> exercises;

  @override
  List<Object> get props => [status, workout, isEditMode, exercises, hasChanges];

  EditWorkoutState copyWith({
    Status? status,
    Workout? workout,
    List<Exercise>? exercises,
    bool? hasChanges,
  }) {
    return EditWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      isEditMode: isEditMode,
      exercises: exercises ?? this.exercises,
      hasChanges: hasChanges ?? this.hasChanges,
    );
  }
}
