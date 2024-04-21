import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workout_repository/workout_repository.dart';
part 'workouts_history_state.dart';

class WorkoutsHistoryCubit extends Cubit<WorkoutsHistoryState> {
  WorkoutsHistoryCubit({
    required this.historyRepository,
  }) : super(const WorkoutsHistoryState());

  final HistoryRepository historyRepository;

  FutureOr<void> getRecords() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final records = await historyRepository.getRecords();

      records.sort((a, b) => b.finishDate.compareTo(a.finishDate));

      emit(
        state.copyWith(
          status: Status.success,
          records: records,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          records: [],
        ),
      );
    }
  }
}
