part of 'workouts_bloc.dart';

class WorkoutsEvent extends Equatable {
  const WorkoutsEvent();

  @override
  List<Object> get props => [];
}

class WorkoutsRequested extends WorkoutsEvent {
  const WorkoutsRequested();
}
