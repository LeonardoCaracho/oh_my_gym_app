import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/features/exercises/exercises.dart';
import 'package:workout_repository/workout_repository.dart';

part 'exercise_type_event.dart';
part 'exercise_type_state.dart';

class ExerciseTypeBloc extends Bloc<ExerciseTypeEvent, ExerciseTypeState> {
  ExerciseTypeBloc(this.exercisesRepository) : super(ExerciseTypeInitial()) {
    on<ExerciseTypeStarted>(_mapExerciseTypeStartedToState);
    on<ExerciseTypeCreated>(_mapExerciseTypeCreatedToState);
    on<ExerciseTypeDeleted>(_mapExerciseTypeDeletedToState);
  }

  final ExercisesRepository exercisesRepository;

  Future<void> _mapExerciseTypeStartedToState(ExerciseTypeStarted event, Emitter<ExerciseTypeState> emit) async {
    try {
      emit(ExerciseTypeLoadInProgress());
      final exercises = await exercisesRepository.get();
      emit(ExerciseTypeLoadSuccess(exercises: exercises));
    } catch (e) {
      emit(ExerciseTypeLoadFailure());
    }
  }

  Future<void> _mapExerciseTypeCreatedToState(ExerciseTypeCreated event, Emitter<ExerciseTypeState> emit) async {
    try {
      emit(ExerciseTypeLoadInProgress());
      await exercisesRepository.save(
        ExerciseType(
          musclePrimary: event.exercise.muscle,
          type: event.exercise.type,
          name: event.exercise.name,
          muscleSecondary: event.exercise.secondaryMuscle,
        ),
      );
      add(ExerciseTypeStarted());
    } catch (e) {
      emit(ExerciseTypeLoadFailure());
    }
  }

  Future<void> _mapExerciseTypeDeletedToState(ExerciseTypeDeleted event, Emitter<ExerciseTypeState> emit) async {
    try {
      emit(ExerciseTypeLoadInProgress());
      await exercisesRepository.delete(event.id);
      add(ExerciseTypeStarted());
    } catch (e) {
      emit(ExerciseTypeLoadFailure());
    }
  }
}
