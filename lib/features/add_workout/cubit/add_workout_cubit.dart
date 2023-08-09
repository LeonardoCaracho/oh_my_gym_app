import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'add_workout_state.dart';

class AddWorkoutCubit extends Cubit<AddWorkoutState> {
  AddWorkoutCubit({
    required this.workoutsRepository,
  }) : super(const AddWorkoutState());

  final WorkoutsContract workoutsRepository;

  void updateName(String name) {
    emit(
      state.copyWith(workoutName: name),
    );
  }

  void addExercise() {
    emit(
      state.copyWith(
        exercises: [...state.exercises, Exercise.empty()],
      ),
    );
  }

  void addSet(Exercise exercise) {
    exercise.sets.add(ExerciseSet.empty());

    emit(
      state.copyWith(
        exercises: [...state.exercises],
        timestamp: DateTimeMock.current.millisecondsSinceEpoch,
      ),
    );
  }

  void deleteSet(Exercise exercise, int index) {
    exercise.sets.removeAt(index);

    final exercises = [...state.exercises];

    if (exercise.sets.isEmpty) {
      exercises.remove(exercise);
    }

    emit(
      state.copyWith(
        exercises: exercises,
        timestamp: DateTimeMock.current.millisecondsSinceEpoch,
      ),
    );
  }

  Future<void> saveWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final workout = Workout.create(
        name: state.workoutName,
        exercises: state.exercises,
      );

      await workoutsRepository.saveWorkout(workout);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      debugPrint('Error saving workout. $e');
      emit(state.copyWith(status: Status.failure));
    }
  }
}
