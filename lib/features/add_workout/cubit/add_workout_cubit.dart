import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'add_workout_state.dart';

class AddWorkoutCubit extends Cubit<AddWorkoutState> {
  AddWorkoutCubit() : super(const AddWorkoutState());

  void updateName(String name) {
    emit(
      state.copyWith(workoutName: name),
    );
  }

  void addExercise() {
    emit(
      state.copyWith(
        exercises: [...state.exercises, Exercise.empty],
      ),
    );
  }

  void addSet(Exercise exercise) {
    exercise.sets.add(ExerciseSet.empty);

    emit(
      state.copyWith(
        exercises: [...state.exercises],
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void deleteSet(Exercise exercise, int index) {
    exercise.sets.removeAt(index);

    emit(
      state.copyWith(
        exercises: [...state.exercises],
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void saveWorkout() {
    final json = state.exercises.map(
      (e) => e.toJson(),
    );

    print('Exercises to be saved: $json');

    final workout = Workout(
      id: '1',
      name: state.workoutName,
      exercises: state.exercises,
    );

    print('\n\n\nWorkout to be saved: ${workout.toJson()}');
  }
}
