import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:history_repository/history_repository.dart';
import 'package:oh_my_gym_app/core/core.dart';
import 'package:workouts_api/workouts_api.dart';
part 'workouts_history_state.dart';

class WorkoutsHistoryCubit extends Cubit<WorkoutsHistoryState> {
  WorkoutsHistoryCubit({
    required this.historyRepository,
  }) : super(const WorkoutsHistoryState());

  final HistoryContract historyRepository;

  FutureOr<void> getRecords() async {
    try {
      emit(state.copyWith(status: Status.loading));

      final records = await historyRepository.getRecords();

      emit(
        state.copyWith(
          status: Status.success,
          records: records,
          recordsGrouped: _groupRecordsByWorkout(records),
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

  List<WorkoutHistory> _groupRecordsByWorkout(List<WorkoutHistory> records) {
    final list = <WorkoutHistory>[];
    for (final record in records) {
      final workoutsExists = list.any(
        (l) => l.workout.docId == record.workout.docId,
      );
      if (!workoutsExists) {
        list.add(record);
      }
    }
    return list;
  }

  FutureOr<void> getRecordsByWorkout(String docId) {
    final list = state.records.where((r) => r.workout.docId == docId).toList();

    emit(
      state.copyWith(
        recordsByWorkout: list,
      ),
    );
  }
}
