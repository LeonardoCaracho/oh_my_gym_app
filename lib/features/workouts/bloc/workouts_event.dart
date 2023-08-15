part of 'workouts_bloc.dart';

class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutsRequested extends WorkoutsEvent {
  const WorkoutsRequested();
}

class WorkoutRemoved extends WorkoutsEvent {
  const WorkoutRemoved({required this.workout});

  final Workout workout;

  @override
  List<Object> get props => [workout];
}
