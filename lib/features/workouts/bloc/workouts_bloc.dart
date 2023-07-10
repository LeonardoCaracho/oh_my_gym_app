import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'workouts_event.dart';
part 'workouts_state.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  WorkoutsBloc() : super(const WorkoutsInitial()) {
    on<CustomWorkoutsEvent>(_onCustomWorkoutsEvent);
  }

  FutureOr<void> _onCustomWorkoutsEvent(
    CustomWorkoutsEvent event,
    Emitter<WorkoutsState> emit,
  ) {
    // TODO: Add Logic
  }
}
