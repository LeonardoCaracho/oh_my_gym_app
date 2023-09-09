import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'workouts_history_state.dart';

class WorkoutsHistoryCubit extends Cubit<WorkoutsHistoryState> {
  WorkoutsHistoryCubit() : super(const WorkoutsHistoryInitial());

  /// A description for yourCustomFunction 
  FutureOr<void> yourCustomFunction() {
    // TODO: Add Logic
  }
}
