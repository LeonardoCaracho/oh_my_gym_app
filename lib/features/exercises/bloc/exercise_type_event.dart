// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'exercise_type_bloc.dart';

sealed class ExerciseTypeEvent extends Equatable {
  const ExerciseTypeEvent();

  @override
  List<Object> get props => [];
}

class ExerciseTypeStarted extends ExerciseTypeEvent {}

class ExerciseTypeDeleted extends ExerciseTypeEvent {
  const ExerciseTypeDeleted({required this.id});
  final int id;
}

class ExerciseTypeCreated extends ExerciseTypeEvent {
  const ExerciseTypeCreated({required this.exercise});
  final ExerciseTypeCreate exercise;
}
