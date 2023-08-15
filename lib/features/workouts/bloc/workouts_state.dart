part of 'workouts_bloc.dart';

class WorkoutsState extends Equatable {
  const WorkoutsState();

  @override
  List<Object> get props => [];
}

class WorkoutsInitial extends WorkoutsState {
  const WorkoutsInitial() : super();
}

class WorkoutsIsLoading extends WorkoutsState {
  const WorkoutsIsLoading() : super();
}

class WorkoutRemoveIsLoading extends WorkoutsState {
  const WorkoutRemoveIsLoading() : super();
}

class WorkoutsIsLoadSuccess extends WorkoutsState {
  const WorkoutsIsLoadSuccess({required this.workouts}) : super();

  final List<Workout> workouts;
}

class WorkoutsIsLoadFailure extends WorkoutsState {
  const WorkoutsIsLoadFailure() : super();
}
