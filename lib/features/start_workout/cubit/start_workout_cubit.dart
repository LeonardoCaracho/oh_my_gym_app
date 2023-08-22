import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'start_workout_state.dart';

class StartWorkoutCubit extends Cubit<StartWorkoutState> {
  StartWorkoutCubit() : super(const StartWorkoutInitial());

  FutureOr<void> yourCustomFunction() {}
}
