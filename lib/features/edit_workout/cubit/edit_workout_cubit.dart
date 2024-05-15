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

  final WorkoutRepository workoutsRepository;

  void updateName(String name) {
    emit(state.copyWith(workout: state.workout.copyWith(name: name)));
  }

  void deleteExercise(int index) {
    final exercises = [...state.exercises]..removeAt(index);
    emit(
      state.copyWith(exercises: exercises),
    );
  }

  void reorderExercises(int oldIndex, int newIndex) {
    final exercises = [...state.exercises];
    var index = newIndex;

    if (oldIndex < index) {
      index -= 1;
    }

    final item = exercises.removeAt(oldIndex);
    exercises.insert(index, item);

    emit(
      state.copyWith(
        exercises: [],
      ),
    );
    emit(
      state.copyWith(
        exercises: exercises,
      ),
    );
  }

  void addExercise() {
    emit(
      state.copyWith(
        exercises: [...state.exercises, Exercise.empty()],
      ),
    );
  }

  void addSet(int index) {
    final exercises = [...state.exercises];
    exercises.elementAt(index).sets.add(Series.empty());

    emit(
      state.copyWith(exercises: []),
    );
    emit(
      state.copyWith(exercises: exercises),
    );
  }

  void deleteSet(int exerciseId, int setIndex) {
    final exercises = [...state.exercises];
    exercises.firstWhere((e) => e.id == exerciseId).sets.removeAt(setIndex);
    emit(
      state.copyWith(exercises: exercises),
    );
  }

  Future<void> updateWorkout() async {
    try {
      emit(
        state.copyWith(
          status: Status.loading,
        ),
      );
      await workoutsRepository.updateWorkout(state.workout, state.exercises);
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
      await workoutsRepository.saveWorkout(state.workout, state.exercises);
      emit(state.copyWith(status: Status.success));
    } catch (e) {
      debugPrint('Error saving workout. $e');
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> loadExercises(int? workoutId) async {
    if (workoutId == null) return;
    final exercises = await workoutsRepository.getExercises(workoutId);
    emit(state.copyWith(exercises: exercises));
  }
}
