import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:history_repository/history_repository.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';
part 'start_workout_state.dart';

class StartWorkoutCubit extends Cubit<StartWorkoutState> {
  StartWorkoutCubit({
    required this.historyRepository,
  }) : super(const StartWorkoutState());

  final HistoryContract historyRepository;

  FutureOr<void> startWorkout(Workout workout) {
    emit(state.copyWith(workout: workout));
  }

  FutureOr<void> finishWorkout() async {
    try {
      emit(state.copyWith(status: Status.loading));

      if (state.workout == null) {
        return;
      }

      final record = WorkoutHistory(
        workout: state.workout!,
        finishDate: DateTime.now(),
      );

      await historyRepository.saveRecord(record);

      emit(state.copyWith(status: Status.success));
    } catch (e) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
