import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'edit_workout_state.dart';

class EditWorkoutCubit extends Cubit<EditWorkoutState> {
  EditWorkoutCubit() : super(const EditWorkoutState());

  FutureOr<void> startEditWorkout(Workout workout) {
    emit(
      state.copyWith(
        workoutName: workout.name,
        exercises: workout.exercises,
        id: workout.id,
      ),
    );
  }
}
