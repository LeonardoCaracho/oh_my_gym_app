import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:workout_repository/workout_repository.dart';
part 'workouts_event.dart';
part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc({required this.workoutsRepository})
      : super(const WorkoutsInitial()) {
    on<WorkoutsRequested>(_onWorkoutsRequestedEvent);
    on<WorkoutRemoved>(_onWorkoutRemovedEvent);
  }
  final WorkoutRepository workoutsRepository;

  FutureOr<void> _onWorkoutsRequestedEvent(
    WorkoutsRequested event,
    Emitter<WorkoutsState> emit,
  ) async {
    try {
      emit(const WorkoutsIsLoading());
      await _fetchWorkouts(emit);
    } catch (e) {
      emit(const WorkoutsIsLoadFailure());
    }
  }

  FutureOr<void> _onWorkoutRemovedEvent(
    WorkoutRemoved event,
    Emitter<WorkoutsState> emit,
  ) async {
    try {
      emit(const WorkoutRemoveIsLoading());
      await workoutsRepository.deleteWorkout(event.workout.docId ?? '');
      await _fetchWorkouts(emit);
    } catch (e) {
      emit(const WorkoutsIsLoadFailure());
    }
  }

  FutureOr<void> _fetchWorkouts(
    Emitter<WorkoutsState> emit,
  ) async {
    final workouts = await workoutsRepository.getWorkouts();
    emit(WorkoutsIsLoadSuccess(workouts: workouts));
  }
}
