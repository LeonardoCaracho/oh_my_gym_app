part of 'workouts_bloc.dart';

abstract class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();

  @override
  List<Object> get props => [];
}

/// {@template custom_workouts_event}
/// Event added when some custom logic happens
/// {@endtemplate}
class CustomWorkoutsEvent extends WorkoutsEvent {
  /// {@macro custom_workouts_event}
  const CustomWorkoutsEvent();
}
