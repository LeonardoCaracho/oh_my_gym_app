import 'package:history_repository/history_repository.dart';
import 'package:workouts_api/workouts_api.dart';

class HistoryRepository extends HistoryContract {
  @override
  Future<void> deleteRecord(String docId) {
    throw UnimplementedError();
  }

  @override
  Future<List<WorkoutHistory>> getRecords() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveRecord(WorkoutHistory workout) {
    throw UnimplementedError();
  }
}
