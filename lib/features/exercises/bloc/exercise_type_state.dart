part of 'exercise_type_bloc.dart';

sealed class ExerciseTypeState extends Equatable {
  const ExerciseTypeState();

  @override
  List<Object> get props => [];
}

final class ExerciseTypeInitial extends ExerciseTypeState {}

final class ExerciseTypeLoadInProgress extends ExerciseTypeState {}

final class ExerciseTypeLoadSuccess extends ExerciseTypeState {
  ExerciseTypeLoadSuccess({required this.exercises});

  final List<ExerciseType> exercises;
}

final class ExerciseTypeLoadFailure extends ExerciseTypeState {}
