import 'package:workout_repository/workout_repository.dart';

abstract class HistoryRepository {
  Future<void> saveRecord(WorkoutHistory record);
  Future<List<WorkoutHistory>> getRecords();
  Future<void> deleteRecord(String docId);
}

class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRepositoryImpl();

  @override
  Future<void> deleteRecord(String docId) async {}

  @override
  Future<List<WorkoutHistory>> getRecords() async {
    return [];
  }

  @override
  Future<void> saveRecord(WorkoutHistory record) async {}
}
