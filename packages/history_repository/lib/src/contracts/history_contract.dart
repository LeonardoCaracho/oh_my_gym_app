import 'package:history_repository/history_repository.dart';

abstract class HistoryContract {
  Future<void> saveRecord(WorkoutHistory workout);
  Future<List<WorkoutHistory>> getRecords();
  Future<void> deleteRecord(String docId);
}
