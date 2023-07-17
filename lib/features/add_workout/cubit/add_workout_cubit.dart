import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'add_workout_state.dart';

class AddWorkoutCubit extends Cubit<AddWorkoutState> {
  AddWorkoutCubit() : super(const AddWorkoutInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
