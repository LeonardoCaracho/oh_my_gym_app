import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:history_repository/history_repository.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
import 'package:workouts_api/workouts_api.dart';
part 'start_workout_state.dart';

class StartWorkoutCubit extends Cubit<StartWorkoutState> {
  StartWorkoutCubit({
    required this.historyRepository,
    required this.workoutsRepository,
  }) : super(const StartWorkoutState());

  final HistoryRepository historyRepository;
  final WorkoutsContract workoutsRepository;

  FutureOr<void> startWorkout(Workout workout) {
    emit(state.copyWith(workout: workout));
  }

  FutureOr<void> finishWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      if (state.workout == null) {
        return;
      }

      _updateSets();

      final record = WorkoutHistory(
        workout: state.workout!,
        finishDate: DateTime.now(),
      );

      await historyRepository.saveRecord(record);
      await workoutsRepository.updateWorkout(state.workout!);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void _updateSets() {
    for (final exercise in state.workout!.exercises) {
      for (final set in exercise.sets) {
        set
          ..prevReps = set.reps
          ..prevWeight = set.weight
          ..isDone = false;
      }
    }
  }
}
