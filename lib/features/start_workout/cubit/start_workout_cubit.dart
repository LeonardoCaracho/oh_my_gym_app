import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'start_workout_state.dart';

class StartWorkoutCubit extends Cubit<StartWorkoutState> {
  StartWorkoutCubit({
    required this.historyRepository,
    required this.workoutsRepository,
  }) : super(const StartWorkoutState());

  final HistoryRepository historyRepository;
  final WorkoutRepository workoutsRepository;

  FutureOr<void> startWorkout(Workout workout) async {
    try {
      final exercises = await workoutsRepository.getExercises(workout.id!);
      emit(
        state.copyWith(
          workout: workout,
          exercises: exercises,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          exercises: [],
          status: Status.failure,
        ),
      );
    }
  }

  FutureOr<void> finishWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      if (state.workout == null) {
        return;
      }

      _updateSets();

      final record = WorkoutRecord(
        name: state.workout!.name,
        workoutId: state.workout!.id!,
        finishDate: DateTime.now(),
      );

      await historyRepository.saveRecord(record, state.exercises!);
      await workoutsRepository.updateWorkout(state.workout!, state.exercises!);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _updateSets() {
    for (final exercise in state.exercises!) {
      for (final set in exercise.sets) {
        set
          ..prevReps = set.reps
          ..prevWeight = set.weight
          ..isDone = false;
      }
    }
  }
}
