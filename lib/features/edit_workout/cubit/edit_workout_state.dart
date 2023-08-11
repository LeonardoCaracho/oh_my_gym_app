part of 'edit_workout_cubit.dart';

class EditWorkoutState extends Equatable {
  const EditWorkoutState({
    required this.workout,
    this.status = Status.inital,
    this.isEditMode = false,
  }) : super();

  final Status status;
  final Workout workout;
  final bool isEditMode;

  @override
  List<Object> get props => [status, workout, isEditMode];

  EditWorkoutState copyWith({
    Status? status,
    Workout? workout,
  }) {
    return EditWorkoutState(
      status: status ?? this.status,
      workout: workout ?? this.workout,
      isEditMode: isEditMode,
    );
  }
}
