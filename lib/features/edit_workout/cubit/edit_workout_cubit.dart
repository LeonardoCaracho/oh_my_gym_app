import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'edit_workout_state.dart';

class EditWorkoutCubit extends Cubit<EditWorkoutState> {
  EditWorkoutCubit(
    super.initialState, {
    required this.workoutsRepository,
  });

  final WorkoutsContract workoutsRepository;

  void updateName(String name) {
    emit(state.copyWith(workout: state.workout.copyWith(name: name)));
  }

  void deleteExercise(int index) {
    final exercises = [...state.workout.exercises]..removeAt(index);
    emit(
      state.copyWith(
        workout: state.workout.copyWith(exercises: exercises),
      ),
    );
  }

  void addExercise() {
    final exercises = state.workout.exercises
      ..add(
        Exercise.empty(),
      );

    emit(state.copyWith(workout: state.workout.copyWith(exercises: exercises)));
  }

  void addSet(String exerciseId) {
    final exercises = [...state.workout.exercises];
    final exercise = exercises.firstWhere((e) => e.id == exerciseId);

    exercise.sets.add(ExerciseSet.empty());

    emit(state.copyWith(workout: state.workout.copyWith(exercises: exercises)));
  }

  void deleteSet(String exerciseId, int setIndex) {
    final exercises = [...state.workout.exercises];

    exercises.firstWhere((e) => e.id == exerciseId).sets.removeAt(setIndex);

    emit(state.copyWith(workout: state.workout.copyWith(exercises: exercises)));
  }

  Future<void> updateWorkout() async {
    try {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );

      await workoutsRepository.updateWorkout(state.workout);

      emit(
        state.copyWith(
          status: Status.success,
        ),
      );
    } catch (e) {
      debugPrint('Error saving workout. $e');
      emit(
        state.copyWith(
          status: Status.failure,
        ),
      );
    }
  }

  Future<void> saveWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      await workoutsRepository.saveWorkout(state.workout);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      debugPrint('Error saving workout. $e');
      emit(state.copyWith(status: Status.failure));
    }
  }
}
