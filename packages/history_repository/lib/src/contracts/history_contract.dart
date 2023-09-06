import 'package:workouts_api/workouts_api.dart';

abstract class HistoryContract {
  Future<void> saveRecord(WorkoutHistory workout);
  Future<List<WorkoutHistory>> getRecords();
  Future<void> deleteRecord(String docId);
}
